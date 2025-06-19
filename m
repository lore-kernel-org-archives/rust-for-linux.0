Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090954A1D
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322424; cv=none; b=XB+s/BagR7AmvocHTyRn1g1S0EobZmY+TsTuOzANiP8uh6Qk+2MYsG1B5k9/wgzIwf8WDuBQN/+oOJvHwoh3tShpAdxrK80PldpBZ7hEleZNuSQDVNJfJifzMtUwnXkyzMg21P7W6tQuYMFyYjRzRoeqUfxpxBSQDmmFHRL9F7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322424; c=relaxed/simple;
	bh=Ufc/JLiYqVAipRJRii534cOUkZiwC/HjHDDVw3WxXZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyr/NlrnAON7kwVPl7uosJIpx+dYeyi/PGJJhBgGbaM3fDU+1s1+kRmMuc80v3NClGu4dUUUv4zYe24dTKA1LBbgDFjb50tJBU52BASPEaYi3AmHnITC8zJxyr9d3iHsZIsGZTkrP5gHiYIyq4sjrUKlrqSn3Ea5LtAJb53CHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WisCsWx/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WisCsWx/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23526264386so6138525ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750322422; x=1750927222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe9QDHLeb2BcmtI9W7EcUmBr8ypmyD9JT4iW89KpGew=;
        b=WisCsWx/us/NC5iZtCmsBPN4wc3vwH4wanS0kgL0tGDb1iUexCriWxQIbCJI1GofbG
         ZjrdXkMMzNrI0N08V4Jt5U3S748+Nj0SEQkeysloib+kQexgiWYBwB0NN3raIR5VkcWm
         9lU1rIEaGdgIVtDVwK9d/lz+LNpplm6ntOeHPEd8LBtED3vWSVPX7Gb59FGsl/IIhBch
         11mkWZ9C+IN2+OquCISErXK0F67jwa/fz+WWaSxwO2unIRNhxC6hrOkNIaa6heA6tI8L
         6ARo3g6Vy+QAKaMH/7zPw60QbJAfWRyOjhsWJCLTSglqIkd/mdAiKqIfO7kwkvDOtcIO
         IQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322422; x=1750927222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe9QDHLeb2BcmtI9W7EcUmBr8ypmyD9JT4iW89KpGew=;
        b=J7qMy4Admxc5G7RbMIAm4RJS53O0ugyVMrk9LPmRjSKAf9yZsdwZHaQv3epVwS3xbx
         j+r6JS52mBid2bUioluBB823fUetxXjz6v6nPu9C2S9BZXKsOwnsWTuHo4SqpSF0TbNN
         hqfyFFHyGs86Q8JtFPECtswX7TIScOGJ7pMoIYzsa0EI1B8HbD8qBiHx0Cq8f4vCvPkN
         NROZ1YmPZCWCxB95XzbyVboSrLY8MthIeE70dTwc4MrYpQ9vP2gmAVQWdI5soRviUJ7l
         bRAzxLVWRMEYkFtXFulOfOvVEQabiZ66bIBBISRFHqbsK32wuIGxG39PqXAIISOgSoR4
         l/+w==
X-Forwarded-Encrypted: i=1; AJvYcCU+B6rDmhlMl2W6w+RCpG84dthdntV/7jxaFqLRrEeIrE4mNthQQveYxoM225TfzboK+gKC0Fr/udWZe3h/Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxAPZAb13KA7dt1PGDKg6YWAgAMTibqNkc1R0udl+1lwU1Zpl
	llKC2xWp6uQy0O+HYtf+GcmJUo7nycG0pLqzrH2Rk31ZipOKWkvn3TIOTfxlHbGzmM0=
X-Gm-Gg: ASbGncvkA5nLQNq/lrUstSUFCHiHwbfxjUdYWm9/VIhRx+hIxqWdXpuspxd2m4/SMPJ
	PWBo+RXZLvOhlFB35Hu4fYMtonzwrsc04un0hXtQ4uKy1V6OIU9gGhLtfYImb5qiFm2hobRfMT/
	bfCBpr5yWfTgrnkYXn/ZxRMjCgDYveI28l4YPXNZhzIsjtuJZWgqV6Ug2pi+0DWhZdk7psguhhx
	VjU/HcVqF5eQv5EH8gR3wBdloT3OMq4YMNVLO9mMD4vc/REYt6B5est1IVo226BJYKrHoTdeRPV
	7DtrcNjw21d7OsJck/jF+95AFHpPujUBKLjxWbLzwhZORqv9R47N+d55jatdg8k=
X-Google-Smtp-Source: AGHT+IGW5qplfc0e8GoHi2nYbNAnZvB4wAxetjyjKY3xR/zkK6nuq7qJNQAohJ/ZLfN9waxkJMbFsg==
X-Received: by 2002:a17:903:41c9:b0:235:ea0d:ae10 with SMTP id d9443c01a7336-2366b329eb4mr344216805ad.12.1750322422268;
        Thu, 19 Jun 2025 01:40:22 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm114351955ad.146.2025.06.19.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:40:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:10:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav ananthu <abhinav.ogl@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619084019.b36nwacofdixktdj@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
 <20250619081601.yeulh36lhrqxo4ep@vireshk-i7>
 <CAGR7w80V_Atc_DuF1RGOFHbvXd1V2j8mMbN3yg+Q6oytiJwNbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGR7w80V_Atc_DuF1RGOFHbvXd1V2j8mMbN3yg+Q6oytiJwNbw@mail.gmail.com>

On 19-06-25, 14:07, Abhinav ananthu wrote:
> sure , should I make two different patches for opp.rs and cpufreq.rs or
> make the changes in a single patch?

Two patches.

-- 
viresh
