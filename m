Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007729A5
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Aug 2024 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723555355; cv=none; b=S6YbOxb3iA4Q1TyZIq/98RSNBaWTWvAWtPjn2ksIjHP6DPAVeQqSyaEA5MFoIgtXtMoHGbx1JlQiklt31ozTjRrxPcp0kkzBDMI+E4iyB1ITYdKoJsUlhhf1ueDotyVXOoWzD2+EQhFQCLYHI6Ch39RyevZt+kx4rRlCq3kM4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723555355; c=relaxed/simple;
	bh=g0HWjYVLVRMnZHDkZTIvW1m6bYeZK6d2IvbwcdH0eWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEYkg9k1AuJB20krX69XMu2qleYPGKjMsmKFmLn3U9hqexrwdvEhQphcuzp6i25Pky6unTttibhbMgQEPJxZQAvj+5mEzQMK6kF/NnJ9Dc8ZR9g+dk5vCaA248+ZwEYelIrw/qgCkfOgg4LoaJ5YRb9AoN8XpHz2jSGZnBlVyqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtEa8+8W; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtEa8+8W"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cb55ff1007so3936770a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Aug 2024 06:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723555353; x=1724160153; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uaypY/wAWk02Lqr/4D90q8PbnvvU28tq9tLGiRFQzK8=;
        b=MtEa8+8W4/cf/wIrMXY5K6YoWqL1so3fvEiBIqTjNlkujLkqxq1gliqE7NhbnORQ+u
         pwLz5ZeGcnEt2czCkdywFyRukFXA62OJmUqpwHTBPnbggTnpGxlEKKKxfwgj/aMK8Oo8
         aQprR5b284CiRAbH0jVbFfoVMI1Y1ncZUuFqaYopKeB7D3AzVvryKcwwxk7TziKRl23T
         pJuaVJJq42BGtlUp54bNeexV0x3qPp06VJe4/EPrxYtCC56iGjos53JNxZA6LSvmAwlA
         Mv3uGtJ6f1lTzZsQ9NCn+Gcg43rdXNrfPMCj2nYcV8ZfKgzQkdBMG0RvIHKzrQKTDn10
         2MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723555353; x=1724160153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaypY/wAWk02Lqr/4D90q8PbnvvU28tq9tLGiRFQzK8=;
        b=AM1+5ljp/q7+/By8l/G4PY9em19YHuvN04ru0EiEZx65fZHD447QqLL297WPhwtiAS
         JVtWSSjQdHrYbqQZNLX4no8Dh/tdaE5RCLkNKfPnoyt2m4hKFTdXuBSSKXEoIpIvK0ei
         N6Lvazzj3IMSG+RS4/UXTB8eYs9Wmm0Fd8+sw10LbnJv6+/pkZom0ZBI+7OzN+JKczKs
         WD7jXnTWja4t+ZqzpyjSIhPdl7CZqXoxXsyXyXQAZd7wpcW/BWlVI8EywauSiJFVn9CU
         ebuv/hnuDBF9UxeYOZ+l7MNNC+hoGye4Zl13Y81fueRVUad2hVEK/3feZK2z8xPKtOBM
         mUkw==
X-Forwarded-Encrypted: i=1; AJvYcCU233DhiHzniau2aDOQxlcJkA0uEbW4ccE+SCQz6LTR4WXo9Uv1/YEir4qVqf0CvnbwB+j3VkOjwZda1jTUHsXONMp4+deYzW5eStOad+o=
X-Gm-Message-State: AOJu0Yyuf71UUKjZXU7e5btw1Fz7duwTdjwrkU9XuitTsLgo5sBo3yKk
	bugN2LU8x6G7bud7v6ekevULIBlpxbBZWt1MlJjoHy2yfCgCTn9l
X-Google-Smtp-Source: AGHT+IFYawUMI4BquHQTJCOdkBjZPCVE2V1Bzq0bzFaIHuR3u9cD18je/p0BShVCgSyYJmJNnD56Nw==
X-Received: by 2002:a17:90b:1c91:b0:2c3:2557:3de8 with SMTP id 98e67ed59e1d1-2d39264f771mr3693439a91.33.1723555352944;
        Tue, 13 Aug 2024 06:22:32 -0700 (PDT)
Received: from ohnotp ([2001:f70:860:4100:e712:ac1a:da07:2e53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcf201basm7220515a91.34.2024.08.13.06.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:22:32 -0700 (PDT)
Date: Tue, 13 Aug 2024 22:22:17 +0900
From: Yutaro Ohno <yutaro.ono.418@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Aswin Unnikrishnan <aswinunni01@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: macros: fix indentation in `module!`'s doc comment
Message-ID: <ZrteCUcz7eT_7TSY@ohnotp>
References: <ZrtbEErNnBNNH0uF@ohnotp>
 <CANiq72=Psp2vyQEf=MQfN61Xqe4UXT08Y=YeOgV_0LLEzTGfRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=Psp2vyQEf=MQfN61Xqe4UXT08Y=YeOgV_0LLEzTGfRA@mail.gmail.com>

On 08/13, Miguel Ojeda wrote:
> On Tue, Aug 13, 2024 at 3:09 PM Yutaro Ohno <yutaro.ono.418@gmail.com> wrote:
> >
> > Clippy warns about list content in a doc comment that doesn't have extra
> > spaces at the beginning of a new line [1], like this:
> >
> > ```rust
> > /// * Do nothing.
> > /// * Then do something. Whatever it is needs done,
> > /// it should be done right now.
> > ```
> >
> > The suggested format is:
> >
> > ```rust
> > /// * Do nothing.
> > /// * Then do something. Whatever it is needs done,
> > ///   it should be done right now.
> > ```
> >
> > This commit adds extra indentation to the `module!`'s doc comment to
> > suppress the warning.
> >
> > Link: https://rust-lang.github.io/rust-clippy/master/index.html#/doc_lazy_continuation [1]
> > Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
> 
> Thanks Yutaro -- this was fixed already in the `rust-fixes` branch,
> which is going to Linus soon.
> 
> Nevertheless, the patch looks good to me, and it has a nice commit message! :)
> 
> Cheers,
> Miguel

Oh, I see. Thank you for letting me know!

Thanks,
Yutaro
