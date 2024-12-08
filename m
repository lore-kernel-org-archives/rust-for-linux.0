Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC823E47B
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733685116; cv=none; b=Q0lbs8+R28LkSAsMFJZxeMX4anYGlkDHsGrq5M17q1cSr/9HhRQaaNxVzPHQ9YBHhKXmOi8dJlqzWJLm6cQ6FE9yQt9ecAas8AQL9sd6nDIDA141TSlQXZPl1Os7sMzusUsLQM83Q6YgC+fkH9gm2RxcTVpns7aTAJw2ZZfp5fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733685116; c=relaxed/simple;
	bh=eTPpdfSymxJq7ksu6ZtbYr0D/vkxw3bk+XmCuiVPtOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amb722TH9kXcioASd1HPTbWzBss1fS4f8uv1YcIBo8sZ2UxWKqiKqO9rnfoj6h4tJig52ixOUXwaWhz1lk3LtYa9FNPLUkONlgtptsI//3C/+HMUNs8llCQtvVCh5geV5jm75AIhEnw0PXzHntPZFlVa7c4/DWk9ZsJUD5BWJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQoinLFs; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQoinLFs"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d88cb85987so30771386d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733685113; x=1734289913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yf2H3DOIlDy2ZXYoggL0VOIKUOZCR8Qyxsy7nAb+uVY=;
        b=FQoinLFsoC+eHxuqxh2UNwGSxmEad4OV/4BYZGVofdVPRrKPjrevAhW8o3q3h8x8ta
         aD9wZmC5Qb8/4FYqVj85zRIh6WCeY76KjQIsz7KGsr6O1rXj6r9X8jKoyGCjedXzvyi/
         nS92yJN1cBUuwpzKdh7K32H36h7Etc8Y0ZIe4u3YNBS06k1R3nn5onsD4ZYSpe/5fVIR
         RjvpRl9ivagE0ID2iMKlbSgIEieoWIm/BuSrl+uwnVKwlNDorO4dmp8d4B4VOl8H2UaX
         pV4Zkb7Fk3eD4BVyWy/EyqhOnHUczV2dstA5OEwGfaBDixysC8arxec3UAAWgAcJ4iRb
         fh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733685113; x=1734289913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yf2H3DOIlDy2ZXYoggL0VOIKUOZCR8Qyxsy7nAb+uVY=;
        b=OCdR5rl4NmTP3+xVkpsK7q5wQEJvqsbHwAGwz25TMt64MhgRyRBw11ZAtppKu7bfTd
         6vVxuKVFqGTmT1uhEPKofOWz6iOEZo26zdEseS3Ah/STtbfTw5dW9iG/VW8yCrM9B09K
         jcAPil6HJzc2yQLiNBSyqKPVeXFAluV+YTvNW9eGSF9fhlqxpuaSNwh+92ypOrieljM5
         77/FvOJt4kamWxRY/kr93ksiZQlb4I1fvxb1nvhCE6Uon3RWV/IUtjsdpG3ox4N/v0mo
         wxRoZ4OgtKwbpZfhfQG0h9HlOEsNY8KG3pZ7HgBBVsOQZ96ZIH8H8Wdgg/k5f3EtOQFz
         PnYg==
X-Forwarded-Encrypted: i=1; AJvYcCVJu/fhy1WPKLWIgBV+g/FuUy2kg+WJ6UMbh824gvI1b+7+j2gwRsgwBjVBFUQBkJ0XthgvoZz+i47qhLotJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2afn3nSA18+dV+zzS6pwwSd1EsdifVCkFuy0heoUiPC9HdRh
	zInjX7nhrwcgiKn73D2d9aCDiqpUGL5k+vtr2rPmholyx0juQ2ty
X-Gm-Gg: ASbGncuAHAJ6WJJzFgHjJhHWKmUCVkK8DOgXG21IUOkLumZ3/csGwflqpxfdQg6EuLj
	ErHA/KfC6b1vd3cC0YwIgMdPnat/vVfwOCv4VpCA3lQNWpkaUJrPK9ZE7T/wcG116xnZkVoTOjD
	gaS8lj3wUHN+7f9FqNJPFnqJNDiQnkUBm7OOHXpBHRLEgaXzXR7KKMKhGQJ/Ca6fgMWSJeuygsZ
	KSTDuHvBUNj3cJjUbDBGb7rn52QZRA7X3qhxe3ddzgnBB2dhSTwJeVyt7SzCZ0V0ioC9EbXnZuO
	cJN9189YlATSqD9frNjm1lB9ncmVzquL1TTNsRlz
X-Google-Smtp-Source: AGHT+IGsxZ8CvZ2UEF5Ju2Bb4kihTZ9CZ/nKmTGq0dukbIjuJRFEYHOvHNRLl/F1vaY0iIGb0XT8HA==
X-Received: by 2002:a05:6214:c2f:b0:6d9:1532:d8fc with SMTP id 6a1803df08f44-6d915330d09mr1743046d6.11.1733685113091;
        Sun, 08 Dec 2024 11:11:53 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6b651asm41161376d6.69.2024.12.08.11.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 11:11:52 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id D9A641200074;
	Sun,  8 Dec 2024 14:11:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 08 Dec 2024 14:11:51 -0500
X-ME-Sender: <xms:d-9VZ2xC71x1-nKT-pvL-eoc1tNmZmp9jxQU1cjNgggaATuQTdgdyQ>
    <xme:d-9VZyRsErOqiRPrkKsvEYQoWlsqKm4-w3Nkr1vFpE1Qg-iDqAHwZtjFfVKlG0QLp
    6a3NDfHFfpwJ254-g>
X-ME-Received: <xmr:d-9VZ4W7kKw3ca-IfvIR08gv-UYYpK4OAwrim7fGbBm72L_hdRnwYEAeu0nD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeefgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefh
    hffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epuggvvhdrjhhsohhnvdesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohep
    sghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnh
    hnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusgho
    rhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:d-9VZ8jBmPswjNhChDKRgbGRAnaCc0b8tBdKX7sF6V0ZTBpMhvgzJQ>
    <xmx:d-9VZ4D2x65P_nYernwpjZfjHSkh6hLhjjwLXrOxykobUrh3EkTlfQ>
    <xmx:d-9VZ9KQgdG4CCvRTdekRwHHjOPLazWMrawGzGSHX-WaLJDW7gS3dA>
    <xmx:d-9VZ_DmfKxpJ5CqynkrC1GleoFn1BpmXQLRdm7CHY5ocj9taJksig>
    <xmx:d-9VZwzBmrYsQCrVVhVx5BqA2CxwBJw0gMQmukVYHMBjlhN_DK8eZW46>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Dec 2024 14:11:51 -0500 (EST)
Date: Sun, 8 Dec 2024 11:11:50 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, Alice Ryhl <alice@ryhl.io>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
Message-ID: <Z1XvdgQOzx3A4LSf@tardis.local>
References: <20241208184834.50212-1-dev.json2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208184834.50212-1-dev.json2@gmail.com>

Hi Jason,

Thanks for the patch.

On Sun, Dec 08, 2024 at 01:48:34PM -0500, Jason Devers wrote:
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused. This
> could result in the lock being unlocked immediately, which is unsafe

I don't think not having `#[must_use]` will result in the locking being
unlocked immediately, do you have an example?

> and unintended. This patch adds a `#[must_use]` annotation to

Are you sure this is unsafe? Again do you have an example showing this?

Regards,
Boqun

> `Lock::try_lock` to prevent this.
> 
> Suggested-by: Alice Ryhl <alice@ryhl.io>
> Link: https://github.com/Rust-for-Linux/linux/issues/1133
> Signed-off-by: Jason Devers <dev.json2@gmail.com>
> ---
>  rust/kernel/sync/lock.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 41dcddac69e2..f6a5e83ff685 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -147,6 +147,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>      /// Tries to acquire the lock.
>      ///
>      /// Returns a guard that can be used to access the data protected by the lock if successful.
> +    #[must_use = "if unused, the lock will be immediately unlocked"]
>      pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>          // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
>          // that `init` was called.
> -- 
> 2.44.2
> 
