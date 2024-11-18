Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED0A55
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 00:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731888709; cv=none; b=JPrrlJaK+QMcIVxUi7nLbxjsJ1f8uAWO7b5pI6i+K681agxD3GSt/ct4tZHpFHwR2vF0tIXokcO8JJxRH6PyzbiGffW2a1XtB3kTtKWESk6TpmxtwJDMNvegVGgG5f2I5G3H5qikFzfZ5Gts+FdDYo0SPlPnnVB9FEhzu9rq8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731888709; c=relaxed/simple;
	bh=SoiSwSD49lv0IM/8lxFpHyYRjD/sbJDFjhrLAiQDzxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNJishSRWvjujpqjxW1fnd7eJVj2Tqhu1Yl41zHH8qDKqAl1f4iMiuai0PDlasVMYVd224kTZ64rnHvV57FcoGXfanI6/67Ewa5jawE5q6fjx4Sd2uv8JLU+d3rVeeLYMGvLPjD4KMG2ro9BHe6a6DBEBzXaBb30fxhvzXlHILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=Gu4Zuf19; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="Gu4Zuf19"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ce65c8e13so25499855ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 16:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1731888706; x=1732493506; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzm439oR2uLsNkSgKqi/IwHWxPKHwC9Szch4YmaJqco=;
        b=Gu4Zuf19xD7wEZztbR94q9cks+9MwBC71zPvxPDdrh91SvmD1TW5//EWdkhWfSV4tC
         EekkYtEBNvtuqCCsl9jb+VhWBuZyc/BB/iGuLL0Hxz0n/sXWmhsxs/HQdqKv446+ahll
         pJWcgm+8EHF8HJefDiZNP85jc9MrUvnNJU7Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731888706; x=1732493506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzm439oR2uLsNkSgKqi/IwHWxPKHwC9Szch4YmaJqco=;
        b=NU+Y/WJqrmRYzWm8C6ffxlbhq4LK0nok2Ey8vDFm1KoEjpq9gIjLcjTud+0dlDmQn0
         H1U7QIaGv+Htbc6y4V7+v9gkh0PLPSG3zzzNRbtZmgqTLu15PUkYdvx2AxDY0/HsP6dP
         epwk3NspA9RIS3LpYau5qsALQG6z3QWfLA1EJZ0PzYr34XyZSMbrJyNuoltHPM2rwYb1
         qWEdv3ROcECWljMHcbJMhRXYG+rmzxiEraA04rr+2vWf8kd35ABWHcUKUqtznah2f4GE
         LJ+UKVCV4sbWLmDB0LOI4PsaIJ/aNa2LcoLV8nLcWObtlGj5a4KwOln/ZX4nth1bYLJR
         2giQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDFiqRiMX5T/OtTKR006WuE8PlYChPPHmwXaejnMBW/0z4WaxiNgBebhOMNLPB2bSLLe2dOsuIfbWXoCG7xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTSAtzLD8jt+jFbPvN7N6inYvD/F17uREpjTACv4GMDVnEmvQQ
	dJ+W/rbWU3hO0U96fDxwRwL2CZH/0EzR+YEZTZ0R12vbBoY1sg3Vwo8v4+FetMk=
X-Google-Smtp-Source: AGHT+IEWvPNXF0LNjE2M13xB8ELSPmICXmcw9ZU6urY/s0XrAzOHzNs7phP0Ghc42LEvoQ5pq6eqTA==
X-Received: by 2002:a17:903:11cd:b0:20c:ecd8:d0af with SMTP id d9443c01a7336-211d0d5eea4mr149867975ad.9.1731888706270;
        Sun, 17 Nov 2024 16:11:46 -0800 (PST)
Received: from fedora ([103.3.204.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211f6769057sm26344825ad.206.2024.11.17.16.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 16:11:45 -0800 (PST)
Date: Mon, 18 Nov 2024 05:41:32 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Alice Ryhl <aliceryhl@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Anup Sharma <anupnewsmail@gmail.com>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] rust: simplify Result<()> uses
Message-ID: <q5xmd3g65jr4lmnio72pcpmkmvlha3u2q3fohe2wxlclw64adv@wjon44dqnn7e>
References: <20241117-simplify-result-v1-1-5b01bd230a6b@iiitd.ac.in>
 <3721a7b2-4a8f-478c-bbeb-fdf22ded44c9@lunn.ch>
 <CANiq72kk0gsC8gohDT9aqY6r4E+pxNC6=+v8hZqthbaqzrFhLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kk0gsC8gohDT9aqY6r4E+pxNC6=+v8hZqthbaqzrFhLg@mail.gmail.com>

On 17.11.2024 21:49, Miguel Ojeda wrote:
>On Sun, Nov 17, 2024 at 7:26 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>
>> Please split these patches up per subsystem, and submit them
>> individually to the appropriate subsystems.
>
>That is good advice, although if you and block are Ok with an Acked-by
>(assuming a good v2), we could do that too.
>
>Manas: I forgot to mention in the issue that this could be a good case
>for a `checkpatch.pl` check (I added it now). It would be great if you
>could add that in a different (and possibly independent) patch.
>
>Of course, it is not a requirement, but it would be a nice opportunity
>to contribute something extra related to this :)
>

On 17.11.2024 18:56, Russell King (Oracle) wrote:
>On Sun, Nov 17, 2024 at 07:25:48PM +0100, Andrew Lunn wrote:
>> On Sun, Nov 17, 2024 at 08:41:47PM +0530, Manas via B4 Relay wrote:
>> > From: Manas <manas18244@iiitd.ac.in>
>> >
>> > This patch replaces `Result<()>` with `Result`.
>> >
>> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> > Link: https://github.com/Rust-for-Linux/linux/issues/1128
>> > Signed-off-by: Manas <manas18244@iiitd.ac.in>
>> > ---
>> >  drivers/net/phy/qt2025.rs        | 2 +-
>> >  rust/kernel/block/mq/gen_disk.rs | 2 +-
>> >  rust/kernel/uaccess.rs           | 2 +-
>> >  rust/macros/lib.rs               | 6 +++---
>>
>> Please split these patches up per subsystem, and submit them
>> individually to the appropriate subsystems.
>
>In addition, it would be good if the commit stated the rationale for
>the change, rather than what the change is (which we can see from the
>patch itself.)
>

Thanks Andrew, Rusell and Miguel for the feedback.

Russell: I will edit the commit message to say something like, use the
standard way of `Result<()>` which is `Result` and keep things consistent wrt
other parts of codebase.

Andrew, Miguel:

I can split it in the following subsystems:

   rust: block:
   rust: uaccess:
   rust: macros:
   net: phy: qt2025:

Should I do a patch series for first three, and put an individual patch for
qt2025?

Also, I can work on the checkpatch.pl after this.

-- 
Manas
