Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D22BF006
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376566; cv=pass; b=tjPOwnPUAwQr9LFfn9YQlH1s0lEFXbHq/eLuXhYMtsS2ozt6+QoXIsde+/GtUak4MwIv9D13HCkT/V/oY8cMCqC6yQK/BLtC+73iGSH+1/JpCMr1Ktwk47NRiZWBcVFRTAO1yY4HZPE+xU1jdhmX8xxcNla/4er3S4SxQ+D5VSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376566; c=relaxed/simple;
	bh=t7U1I99fQ7pWNXqxEpLpcP8Md7ce0CpoXzY3AJaWl8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ed19WEFZaMJ05vVV6gADVFBVIoBckgduhE6nVJUfZyZJTfR8bw9DI0gv50xPxpB6gNd3HBAUpLfKwFopXIy+Blw2wrOSZvdvEHPmDieztI21gORRVznHtoOjITuk7avUDLNQSjKpesxFzRMR+GR8BCKwvjG+f8dTmlltwtCWMwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzgz0Gp7; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzgz0Gp7"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12dc1c0b724so263687c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 04:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777376564; cv=none;
        d=google.com; s=arc-20240605;
        b=gYR0r08y8HRa5aD1mT+zxKLD6fzijGXAdRpyokmbP5FgF9S39Jda07BkNg1BIf5VkR
         /MiR/P3SuY4cKnxD99Rza4C6mQfuRnANSPItr1AIqft837fkvN8cmaq9jmbfctLgx+Jg
         7EjcsDqnODrQaZN9Zh3PCEFV37rDaVWsAXe6Rt7vVUZmA+kxdYdMpvL43KnRf5hxTh4w
         Jg2PdHm6slTbuBq7Zk3eO8sWPug41qx4ME5f/ldEODk5ONr3yHQ1o5T0H6XFnth+65W3
         Tit2gFoPioFC44q/j4puDfk4TxPQHdTYG1WyX65xU9Ka+HH/YE8nHS1YlQKT3DFaLgHu
         CfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7U1I99fQ7pWNXqxEpLpcP8Md7ce0CpoXzY3AJaWl8Q=;
        fh=JLx3DspR4vVqBS8r9ioBCGphDNYPO/8rzA7eabWTGvo=;
        b=MIs08sNSHgcqxhgxYX9dAC8uJ6e82qkpJmo8j+15PBfFzWPrpITH3a5hCTBoLJQK/l
         sJLALZmjAsRZTPaV8or+trmCoiHB/LY1LiivtHesCaByabH5DtlPPA2HEWHRoMN5ZDS2
         MsAp08bq5RbGDrfyvLD3WQauByFPfg8OnW0HQcgGCQGgXUgk0ij1QfTT2Vxjm36/5Lts
         0C71d6u9He2QLshhUD8iDmIInMFfFmi5jCOEdO05qDh7DhsBrMMkpbUJY4qX/n/qJ4DJ
         4GIU7sIjEFT/g7mQYSOEpk426EDZdA0Of97QvMSThG/a7gN8U6w+8POxjJG5DPjWSkxQ
         tD1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376564; x=1777981364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7U1I99fQ7pWNXqxEpLpcP8Md7ce0CpoXzY3AJaWl8Q=;
        b=bzgz0Gp7SzHaDTrVuX/4T2GPvJAXbuRrJAQiyBULDz8uGKybNXb1pKv5hCXLpQBWcN
         AynOQAD/K0dbkyLxTSmnXu9W7OJ/dz0ivnEMtFNrLWhnky/hDFBGAdJjrq/NvLA7y2Rp
         ThrV9pLYi037TUggq1BXM0bkaKu98vG85qUb2twD9zQzYBzGQIRLCpQg4rM+t2i1e0aV
         9+UG82BFYHWJOGl7/BDLvmPK4w6MkBVh06Bd2f9SkSTsoYwKMeCHLBh6GzPhqTTDDHW4
         thIfRP0l1DIDRbA54D6dM78WIkKG2K/ur3AGaOEMHncMFJn3QlCFowwijFc7Lf/TF/UP
         Bepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376564; x=1777981364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7U1I99fQ7pWNXqxEpLpcP8Md7ce0CpoXzY3AJaWl8Q=;
        b=DUZ3W9jIuYjIjvldAngHHOWYmAHPBZLrjhAaKWDbPP9vtMlaZ749PQ6fXso4ojtJ+L
         sg/0p7nDu16tQ9YTvQ3o2CXN5QgOFET44FSTLLzFHkUvKGixDOd9qdM0aTuSRmUveiTh
         4NVYTVBDFYp7dfvm5mikIKwi/MaPwdThEdQvuy66Rw75xzVvhkXz+9lEiefnLoFyNi9m
         hhdzaI3QH/Ng0kINfw9JFV1XZcYOJfdxgJJ9gIv0r//xwTshcWB/ikfMKVeuykKpHzAD
         hSPIfafOkHzSI0VmxYakVS7uzpGr4pqAeEx9FSdkRky308pabHoO8q/GIxARG9+jlFb/
         WXAw==
X-Forwarded-Encrypted: i=1; AFNElJ9+rt9WMy+tQDJNXiHKoaZJNZPkS3SxYlwi+xQP21Q6E+VyHxW4azTjOGnfjdDGPggxjoHFnrot6UIKTFgjzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lM7C3d7x2Wt68gQA4HdbE+bo4oL3ndni0SrHcLWs9axcPkws
	MLOz31T+cA525TVrLI3k9/3MDXVKJw6o0vzRGaCHzdXE58C3c0LkIj1Xsjl3SacRWIofBtWNtG2
	6cz9OTv663yk0NSEo32gd/c/3aJdlS0I=
X-Gm-Gg: AeBDiet/gK1XZpUP7wKna6KFOg4/Tc7vzNuGI82GZaTM5r6eEcTBxl9sKStfUO3NeQw
	KP1//ZDvq4PnxMliwigytuVtnQ8/J+ypNtp8PyXV4BFf7nzTbBqG61PeFoOmSaMdz5r2ly4rxYW
	+SFxieATTWUIbUroeft9s4mSVjDyOw5sQLVXD3RjlgiJBfVPiEjhOYEPDtp8hbePqc2pTMOv/e9
	ihPMSirhRs72MgHOFs+aHRbw0mvrMz1EnACGYrgKRj+w7SnMKlJsZG5j5BTjxzH24UOLkNsBbKJ
	1BJmkK40f6ZcgVHW8BvUBazzg1jXW8dHnag1pL7FDGrY2TjjDGqfRIibyopRWvxKMFGtLzGeN5Y
	p28VYl5GJWcOvfQw23mrpLQajcgERTm+Hsm28SPA1JpLw
X-Received: by 2002:a05:7300:c99:b0:2d9:94b4:a1bc with SMTP id
 5a478bee46e88-2ed09c5948bmr550045eec.8.1777376564511; Tue, 28 Apr 2026
 04:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-fix-docs-mq-req-v1-1-260079853836@gmail.com>
In-Reply-To: <20260428-fix-docs-mq-req-v1-1-260079853836@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Apr 2026 13:42:31 +0200
X-Gm-Features: AVHnY4I_JrD0gOPQgIr5jL9OggUWKIBHYEwQJ1j4f5vRyy16Ar2QjhP6OJ-iFXA
Message-ID: <CANiq72mN+tGZ+AMoxVbok5HwnHFMsmoZ1bpwPmSvN6CbC-Z-fQ@mail.gmail.com>
Subject: Re: [PATCH] rust: block: fix comment referring to states by wrong labels
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 9:25=E2=80=AFAM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
> Fixes: a307bf1db5448 ("rust: block: convert `block::mq` to use `Refcount`=
")

Since this commit exists in stable kernels, and this is visible in
generated docs, we generally tag them for backport, so I am doing so
here:

Cc: stable@vger.kernel.org

Thanks!

Cheers,
Miguel
