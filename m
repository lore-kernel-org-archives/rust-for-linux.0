Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5932FE04F
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991407; cv=none; b=Kj4kzt1PDWcGYzJZXNdGdVbg+G5ZKbTPZgMDxnL5+ZUxVr23x5v5HYOsSmfT6qsV4hA7xkxI2J5ZHPphZFLAE4S/2PBa71xvDLtrtzLpkjNRWVzrPJl/PTF3vsvx6WXo0xuaRUdGWKzS6gupMCEWtarmCbnNDx7DAqyGRJscrmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991407; c=relaxed/simple;
	bh=aa/yg978l0hp656ZEYGts+dDXE6SPkPYz7Q3QwwfGGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nh6uYxtioHGqc40CA+MsoCA5r0JC/5T28SId9sFoMy/BimPWzXWk12uTu7WyF9vusY7v0PTTzUOrPmUadhuJAQR95a95AB/VuSmHYlmAEICPD++QVzX1YN+IYYLzw/iH2tyBej4xMuLaNCO7PzxstV8JbA7CmZJg4tWHjqWtw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tfIcCaTD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tfIcCaTD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3dea538b826so817805f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Sep 2025 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756991404; x=1757596204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUmGcnb9DOoFKF6N0qbvgApw3pjqcT4j1CgQZsy8ec8=;
        b=tfIcCaTDXfGHtHbu+OU/RAJCaIPkXvfxqjwYQJWI7WUy2gSo6krZ7SEA4sAnQHpBsG
         sy/s5nfnVFv7XcQgdAPXZ/K6Y/idlH4/dd9pivmZGfHGga6WXyR81zMmR6Y4IRmvalfu
         3XBAA6ZJ2lqzCWccj0wWI4JZm4RdgMieEYCPgIrhz75ZggZwe1am3ULdpmMPmiyJB58H
         02vxJbHpLm3yXAo0fA7IfyZ3YUkOl1tW5vEP/cHfJPj9yK3esO9eJKJ0ecOplhhfgkfA
         d57CAGz58C8HShOEEXAWS87wGOplO3QFwvLc5EBhc6kVhnLiUSzU9Oe9lySxWyDJa2Tp
         +IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991404; x=1757596204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUmGcnb9DOoFKF6N0qbvgApw3pjqcT4j1CgQZsy8ec8=;
        b=d0ShU6MR6GxSb4NkdY/X9kPvgWyBWTEo22ZHyrCTbXTcZwR+oH/110jFdmBsfkkrU1
         dJmdHNnDEWGOfgPjOQq23sC9s+muUe37FehRusqvM3252MtqmXMVrgojQvNk/+xIURdF
         NtV3dnrkKosNOm4FpJCbdO/oKQKsNNWpy0V3PmnPRlai+w4DvOUJqdnygoMMAbJe2BTE
         Nzmd2gJ+0+mk8zhv0Riu5JwnHRXIlJKFHdthGWHHL1PXDsn+9LCwYSFI0DsIlQN581EU
         yRlJQgzpXzmABZt71RRgXG0gUP2LZTAn9Dw29yTYtj8tTXzpFvCmTff2NQXv7OV1UkSY
         2tPg==
X-Forwarded-Encrypted: i=1; AJvYcCVxq5zCFLigJmztYSipjQGICrUCFSC76id8B2QRLvv95UGJUcyts/bkBn1f9Oj1Re4KiE0wr7ZcgrfGew8GxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiqXwCm3niQkPLw47mfNM0BPkojH1lzk6GuXKhF/m6qSnMDik
	jqQxIUe6Pu/at3LmGQsU5Y3QIKzAStJ2mOVjNg3xVnON8c5AJiaokOS1sq1FZ8h6TK1JO6fSHhS
	R5Z4Pyf57yVmUl8LJNaBSpTX+QAHEZo0+2vzhMEBEBXhrBRHKLTawZKeE
X-Gm-Gg: ASbGncu3tCNybYtb8Sbd5K9fl4sI98Ob7HzIBBxwg/mYCggZvCLK7xsvfHQ7g8sqhkq
	b2hXI4LG1yccgezjpwUWmWYfH4PM9gd8j6Q+uPHATRve1TBMOGCIzPsXZ7CKaWoKrEofiEVgnKf
	39Mp6Euaqc2kiTKEyd1uMy++abKTJSnGXMFYVa0+Dx37pSZWC/hFmTdHlEA59GWszZacOzQzbr9
	E9XVfA+f0qTTvmRiEE9T19Ch0+Z/mPK5MzfVU6nPuYFB6u3Em/niGtKMIsIvCy68UdISAiSjvp1
	XIApqNYjv5o=
X-Google-Smtp-Source: AGHT+IFHJ2ZrBugJMZBEfCi74IIrGqgkQHBE6XqdlI+XjphUPOfhoV+znXePJUYjgikhYscUmFzUrXSIaK4FVkPPW1w=
X-Received: by 2002:a05:6000:1ac8:b0:3e1:2d70:6785 with SMTP id
 ffacd0b85a97d-3e12d706fa9mr1875838f8f.31.1756991404184; Thu, 04 Sep 2025
 06:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829224116.477990-1-lyude@redhat.com> <20250829224116.477990-7-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-7-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Sep 2025 15:09:51 +0200
X-Gm-Features: Ac12FXy8H7G6oV4EU2UIFIgA0FDxXvR6Hytw96Q6mBmUHCGBN96sbfN9dB0h2Kk
Message-ID: <CAH5fLgjFePwYmyivpU-Vk2KbKtu7t5DJ1cZUJmEQ_Y+Dgynk9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] rust: drm: gem: Add raw_dma_resv() function
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 12:42=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> For retrieving a pointer to the struct dma_resv for a given GEM object. W=
e
> also introduce it in a new trait, BaseObjectPrivate, which we automatical=
ly
> implement for all gem objects and don't expose to users outside of the
> crate.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index ec36cd9ea69ed..f901d4263ee87 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -186,6 +186,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
>
>  impl<T: IntoGEMObject> BaseObject for T {}
>
> +/// Crate-private base operations shared by all GEM object classes.
> +#[expect(unused)]
> +pub(crate) trait BaseObjectPrivate: IntoGEMObject {
> +    /// Return a pointer to this object's dma_resv.
> +    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `as_gem_obj()` always returns a valid pointer to the =
base DRM gem object
> +        unsafe { (*self.as_raw()).resv }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> BaseObjectPrivate for T {}

I think this use of a trait is somewhat of an antipattern. I would
probably have suggested a standalone method instead.

Alice
