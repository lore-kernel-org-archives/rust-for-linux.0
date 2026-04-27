Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70252E11D2
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 03:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777262307; cv=none; b=sPsEQpmr0+WZDpjZAXhbGzL9Q82aFCasZUkJhf+WESwWKnyieFtNZiL6aKGm/9WE0g3+M99larQtUzCaeF3EKusI1Iy8w4jJi0c+3HsRZHvLJjp3Y1bzRMHgrYPM59cQZ7mT9KZTDxTtChtYUgCvrNLg0YV+AygNGr8pKUGm0PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777262307; c=relaxed/simple;
	bh=ebTLqvJ8TU4SweNZX+gkXIlTxan4FkVR9U1QHLSMC9g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwadD/qtCT4yNlsnQx8b7Fn6M6cGR4S5ipf3HI17tWNpMyjQFotbaY2ILvQW9J8LnX2pmNf1fy8CsqRls2cO7/SOlOmD2UmXuFSj8bOYObGzzq5547tIkk8pKkR5jwqUmK0O5ouZoCa6SyNNHG1lYlpN57iDskiV5o1Uwyx9IFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRon1Y62; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRon1Y62"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so5125908a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 20:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777262305; x=1777867105; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aDwV9jOGS1Ta3doKCAH5P3EaRc0vCO2ZKbMN+NTdxUo=;
        b=sRon1Y62sFt9oP1TuCA5G7S/tsKAQcGtqCPq1nTQytrpOkyfboqaJ+RBctemXYGAZD
         99yGx+R8mUyHHZMfKriOB6tC9my+CIjy8GumAp9UPSOQrZSs3IvyOBD5Oe6gjZ+CJdZO
         YQ0loxIfWtXSX9u+Cxrie1gzpHq50X5z+SyFWOpKcd5/Eo970dLaPTBia5OODPb1hvLV
         E4GiYJscFhT8IhfGws5cDvn8GkLViwgzjHRBLx1oQJEW6mOe9bazMcUROO8R4YPk8B7N
         mpmsnA2YST/eGX0jJNUNEdO9+HZh/uD0h6lqVPdN3FcK8eRWAwHb2m4WM8PW3Q+Ogzfi
         j82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777262305; x=1777867105;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDwV9jOGS1Ta3doKCAH5P3EaRc0vCO2ZKbMN+NTdxUo=;
        b=itO9qQ2I65UnKcHmrRtgGeS1hZD7vsC2Uh4iur5S1yvOxpAgD7TlmASIbNgKewaL8y
         Cf+tdpWfytKMYXxb893kOoxOyqUluXStv7PIILxgyFNvehoA6/+FQ95LkKRxLhxnZzzw
         OFRygjTIkWxPTzy1aVTUGkcGBXK5pbigw2PQq4UaeDfBIDVlrDGPTJG+Wov0IJB194h1
         22BeFHQs4cW71bv8ySqeOSsOt1oDSaEP0VzLJ1KUar8ALAMRbhN2HpiBVJtdYaQyx743
         FjtJB6g1OXRL/CDmfqyVGexwLLVovhkCkDGqacx+94fSQDh7tNIy9ajFydjveJwlfwDj
         2JHg==
X-Forwarded-Encrypted: i=1; AFNElJ+phnafou1qEg5iZ2/8+Er2Wkpr3AmkdPLhzObIrsPaHEsFHJMtd7tZo6wp6jGRgqtpFgn9iIuHFwMPFU5EEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNeFR2xVLcIyaF7QPaxiHu4cvHlrL0Jl2SFuAkUqjrNLgKvDB
	VTpWa+667HdFH25Kz+ruOFvLX4JGXrhtlKcv0NsL2Ncp5PqyotB+7A1t
X-Gm-Gg: AeBDieunlDGCe1zzIGxHEVPhu1ynRq4O4CHEF2OgRO2N4ZpLLcDb1o4Tb8vf4lsqH2R
	D+0yAqhainNMvVyb8i9dHPgGApShH4bTV2JYN07prKk4qGqHUQbwiI6Ni2zB2CNHxL5IX3WQS3e
	eegI7HdSCxFfRvjmj7nyFZtAjp1Uw/5BWQMh3TN9I1eR9qTesLW0zI4THVuLaZr2Zy6q9cNL7jx
	sguQGKIZBlxPC2i7cAc2IZC9bDQbGLYsI3BR6oLtdjb4FlDxOj++OrcCLcVJEz7L+i//ECjd0tr
	J+tFrUv0lp5lI7cZS7+1/EMrbRjQkvC2a/cEmqrmz62Cx6oxzuRf9ZQPWoonSWS88kcHDv5VDw+
	2WxrhxUD29qFk/E+QWrwcH8dkSEqNu4zQX5HR1aBLrGs0jr+S5dw9DJHzhoeGWDAi6iJv+0ALfb
	ddHwdLw3GycfnjgvLi0rzoux36wQHsxJQZgROHn8vMEbQbvZ4=
X-Received: by 2002:a17:90b:17cb:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-3613ffce5admr32691672a91.2.1777262305136;
        Sun, 26 Apr 2026 20:58:25 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7a9fsm30321821a91.12.2026.04.26.20.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:58:24 -0700 (PDT)
Message-ID: <69eedee0.170a0220.230e6f.9507@mx.google.com>
X-Google-Original-Message-ID: <ae7e3HJCPQ6cYluI@yuwhisper-pc.>
Date: Mon, 27 Apr 2026 11:58:20 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: alloc: fix `Vec::extend_with` SAFETY comment
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com>
 <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
 <CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com>

On Sun, Apr 26, 2026 at 03:10:12PM +0200, Miguel Ojeda wrote:
>For this case it doesn't matter too much, but in general, when
>something is a fix, we add a Fixes: tag (and in most cases Cc: stable@
>to accompany it). That helps backporting (when needed), adds context
>e.g. for reviewing (at times), etc.

I did miss the Fixes: tag — and what I hadn't thought about was that
these tags feed into the underlying tooling and workflows.
I'll make sure to include a Fixes: tag in fix-related commits going
forward (and will likely use one in the assert! patch coming up shortly)!

On Sun, Apr 26, 2026 at 03:10:12PM +0200, Miguel Ojeda wrote:
>By the way, now that I was looking at `reserve()`, the assert in the
>example there should probably use `>= 11` since there is already an
>element, instead of `>= 10`. That could be another similar patch.

I'll go ahead and work on that. I was thinking of changing it 
to `>= v.len() + 10`, which might make the intent clearer. 
For this patch, should I include the Suggested-by:, Reported-by:,
and Fixes: tags?

Thanks,
Hsiu
