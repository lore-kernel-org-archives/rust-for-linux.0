Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69332DBF48
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976934; cv=none; b=iRc/iE8Rxw3M680usS/aX3b7LTjYaI3TuP2LR5+Db1c38GeELqTUz+P64oTXirxf2qeAGRWwRWzpZhVh6YS1pcxTfii4A+FvGvJi6dt/eciUB2SjQhkQW65j5stV9wuvv8EGTi1xXUxFOk+GQsqwbDDl9ZJGl7DM4ofsDilD9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976934; c=relaxed/simple;
	bh=9OuwB/mKcO6haey57JJkqXea6iJb0zgcty8aAKBWe5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGrBvoJWKF8NHU052niFib/6tcClJ92F71+x7Gr7r7ehdq9putjg7AvphHdg2e5RyE/jmU6o9xROm/EnF+Z43LbGuGJukCH/p8ZI0uv5kuODxZLVGx+XQvziUb2N6kR1iZ848ws5oDFS9fRNHuEdqwx8vnpdUfbDk0xijfFjXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ceca3pwi; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ceca3pwi"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77287fb79d3so781565b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Sep 2025 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756976932; x=1757581732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmBbjONRTs6bzm6TRjxemHxdhBeOSzGNBuBX1gDxW0c=;
        b=Ceca3pwiSSggVuowWec1JaLEyCaRIHEEeuEXh/Pg2vqE4eeee5PYsZ+7FpTWtLbdhj
         b4fSSdlxnHgsOgH0tE4QoRCkkGqnV8SE5M0FsiiPVT59UJZ1++fNuZk20zJPCpBdGnsR
         bpoIUhJsiAOj7N0+5yRiIsQOKPKmMd/wVrADJu5SOAWagOrdk6vbjacvbxuc3sXT4oVw
         zFBGDbt0SKUAyXznewucg5kpr1wGY5ascZUvXoNkaSBuaeaPLSDfGckGKi+g9W59H+W2
         Xcn+nidUd00WcL37TCqzcWFEEUFK96Pv2bIHPNTXA0qI0c0dkaHNtr8W9gP24zxFye5r
         2veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976932; x=1757581732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmBbjONRTs6bzm6TRjxemHxdhBeOSzGNBuBX1gDxW0c=;
        b=RWILEsLXA9LrqMQyANJwOoQ/6oFt8e6FgzZ1u4qQy1Y79pJaQPTReGkcDde/06gSvu
         7SAgySxQQm2oj9nBIhGwZKcwCD7CSB50RIpVZNML07fqPo4MGAQCttKFk7G6mqlSmmKy
         2sod8PgwqwnuqGSKy+aYLs5kZ+/kSDabxTSb8+vDLSbysEx9iBM+XARRQDjuMPjfiz5S
         dLpcw1eWB8s3pcMtlndVexi2fFTUn304qRAGGnX7cHlsHz2hrLPc5RJBwvkMeuS7fWbu
         GrxfBlWkywb6EMaobsVETZPT2luUjTlKQdw2ueTi/jpBI7Uw1bbsiwTEmDnL53MEJ1BR
         i4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOiHTdRFme+mLzloYVSJFd0y2j/hIhmzFt/MV3Olh5/0v6cpKgQz7C7rx2HdDxArhYZAx25jvwpzTzYjG6Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCJrYpo1DSAaZVcAbqc0cjLRm4IeJXXpCYHLoxXLeEsRaw8nWn
	0/F7rhE2gNfbsOxyJaJujMD4gOApemsg8YilWo7YaYH7cQ2nt+qfUlxPVxJSOWkJicQ=
X-Gm-Gg: ASbGncvRE+1FfXkS0isWtB6z1DHL3wY7md2cR59ceL0l4NVqLxh+W73p8KBcS6J39FN
	3Yw5GVdUaQ3MvekIgDrpMEMlOPPwf4UcwS1h+/zrpYYlKBGwwttCd/UfRBjhIoeRBRTM7K6M6nm
	fy9BtZotjg/qhyQEhzuo+27U3jBv35w/SIrLx4XmF5ucEkOMR1p0hRaqvcsTwO3PioNzfeYZt7c
	YT8YTxfwaoFfUrmAq8MKgdKiIK/ZfvWOpDZ4dElp3ghOf6s5LwxhmMhBkSgHA8muezLTX0qF4Q6
	mWj2fP+g6x3JleeYGE+/Uplj9rkbg1s9bqA3JUuY0LWYXk5HOmdYbgmW3HJvLWRmoq53u4S3TsY
	8OhoS/D791eoTmzzKqO2aW19BZPSglq2Wsz8=
X-Google-Smtp-Source: AGHT+IHI7lc2wZNpnK6c7bml3S96KONYzvjvTqV1qrfL3bzvd/FiM6GZPsewH6KTBQYgX9g7o654HA==
X-Received: by 2002:a05:6a20:3d86:b0:243:a189:f1f8 with SMTP id adf61e73a8af0-243d6ddb3bdmr27908154637.8.1756976931899;
        Thu, 04 Sep 2025 02:08:51 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0736ba7sm16257509a12.12.2025.09.04.02.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:08:51 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:38:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: clk: implement Send and Sync
Message-ID: <20250904090849.7uiroafxk5juml6b@vireshk-i7>
References: <20250904-clk-send-sync-v1-1-48d023320eb8@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-clk-send-sync-v1-1-48d023320eb8@google.com>

On 04-09-25, 09:03, Alice Ryhl wrote:
> These traits are required for drivers to embed the Clk type in their own
> data structures because driver data structures are usually required to
> be Send. See e.g. [1] for the kind of workaround that drivers currently
> need due to lacking this annotation.
> 
> Link: https://lore.kernel.org/rust-for-linux/20250812-tyr-v2-1-9e0f3dc9da95@collabora.com/ [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> I'm not sure if there was already sent a patch for this. I recall
> being told that one had been sent, but I could not find it. Maybe I
> mixed it up with the regulator change, so now I'm sending a change for
> clk.
> ---
>  rust/kernel/clk.rs | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
