Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1A2C08A2
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769865908; cv=none; b=RbRSA+Cw2ruD4vLWD9PCLxkVY0SCHXq+tIAe8KtV9FCmQXwgLTQHUEEohXxmqsy9VkY2leMv6TWsx1yefNSOQv201By7ZtxgbfwHPvT7aoUcN/hi4SkaOnTxWrwavVTPyx1FeiMER9FQFV2U2ITimYM37gabkAuMo0ZWoTvt2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769865908; c=relaxed/simple;
	bh=Bk7SBiIBm3FwBpzQ4dgrgk+HmRJwxX8GwPxRQka3j6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cNIueafkWQ7x1kDmHDjeS8stgtX6RpYpZyAqgukqBdcsGNiunxsN1kyLcE9UgXc33Xs+qBkCBsoUJdyH5ahRzKhDbzn+C4aaV4fMfkP4BQZgQjLJXrxJhAZTImTr2JQjmRKVvHibT5q0FFphwjQUD78f0BCkPd6mo7JbElP1h3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGqMExBd; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGqMExBd"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f526c39718so1830433137.2
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 05:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769865906; x=1770470706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1sP/AQBesfEGRuDam1aeVNWf/d8zYSibVohue0w9+M=;
        b=LGqMExBd+uOQV0KiDE/tj9z3oD7SYzf3SQSS9USyXzPH+dPDlVDzov8vK1ldlI7GC6
         vOlKiPW7Iwu9hTE7FbwQ8490HHucfV5R6zsDl+rXlHpH9r8VRcmbERqcASNQZS35eY0i
         Vt7I7F8J44CvQwL/6puw9utOry3KOyHWf7ROzvDLGWxBhXGqDVx9pxN9mbkeVId/rDRD
         fYLhgx1or3UDZ8hgomrNLNSGbdnDn29rRSDbWEh2wxeL0OIYmxaTHLL0xa9rKid3Z7vY
         C3NM67CuertEfS82Z5F9d/8Qvj4/AIOtwheXTrCARc9AvfaYb4HlIfZTQPkZVKsjfDov
         feKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769865906; x=1770470706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1sP/AQBesfEGRuDam1aeVNWf/d8zYSibVohue0w9+M=;
        b=RJCukRMqU42JErfblLsRWxclphvrCm3yrlbS6W8TP8Oo5NJ9HxJvIWJy5hLd5O34+g
         PdWUP987lEa/C1MxVRgGpYIzq/mWjT6a/0UOhY4rq2nyCHa3xojbDM2fmzGQYxr32Hwj
         orZSF0tySIEDkPWP5XIOFAVX8OoYcgQZo+dywFqhOFneouluXZEXwoAlclmdeS7hJ7Q+
         rX/BfxWnFl9kFQZKBU55WMeNQMCrvdeSBtmbEEpJ8i7wZ6v8wb1c+JnZrVTKqqx1nQMD
         RVzs/Zdhr0ExvHXdNf3Gc6QWxU4T0T/z0q6LHLJE7DLJeYGWVPRljGXiGVc6JYzHHf7C
         gs2g==
X-Forwarded-Encrypted: i=1; AJvYcCWipk+ZNjpc/+iejOMZw9JmF8dMSDAsEXX3dsWGwiS2pKOZbTB+nQrcYMdIlidaJN5T4dzUIpime4lr0I0fIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkoZaJBgtOgpSTaFxrnDc6dGVv/sQEXgYYtxqqKUHIuOTh7kQ
	ShYS2XdS2bPdzXZaWmjEniyad1pAZMcHml3SZzD68dAH7V4ChQ9iwDq1
X-Gm-Gg: AZuq6aKYJa+g20JPN0G3cZSDCOptTnjmqNepUkKbLjjTpPGFYbeHvsiNHgYAi4+ZYF4
	U/8C61AVPNIi8Wc86/HFPqVElZgqD10HTFgqzTmbvh6vQloBqy8+YdnVYTiXm0a9sfiOXN99zIZ
	dsaGwN259wZ8JbmTa5xISn9XS6/1Abk0Wzu+VmJEUOGnEXh9iPZ/3JzxqmM/6Mv2+5o+oMX4EW/
	woVbgu7bpaTsfXPEF8eenbmD9nE2M54oqzw4fRRPXJavlPwC7oHofO0NSpCf7Mwq6FIHRCg/KkN
	1F1oez1hYwIWe29QHLGp+uMww8UW3QIj2vmNtalY3HWH606ktsw7hPnd0xB4uWTQQbpJJ/OtA9V
	07CSnWvdrgE164kuet54XHzwDGs1XNbRJhynp9K51p5gOUuS9tX9/nU2UGLaBUbjyP8Jl3IVSGz
	4J7h9HFBnCdTbbDxedbOOooNDm15I=
X-Received: by 2002:a17:903:1ac8:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a8d7eb5d19mr64864785ad.2.1769859340371;
        Sat, 31 Jan 2026 03:35:40 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:7:99c2:2d1f:8664:c99b:8d4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eee8bsm92559415ad.6.2026.01.31.03.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 03:35:39 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v2 1/4] drivers: android: binder: Update ARef imports from sync::aref
Date: Sat, 31 Jan 2026 17:05:23 +0530
Message-Id: <20260131113523.7031-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102202714.184223-2-shankari.ak0208@gmail.com>
References: <20260102202714.184223-2-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jan 03, 2026 at 01:57:11AM +0530, Shankari Anand wrote:
> Update call sites in binder files to import `ARef`
> from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> Acked-by: Alice Ryhl <aliceryhl@google.com>
> ---
> No change from v1 -> v2. Carry-forwarded the acked-by.
> 
> Link of v1: https://lore.kernel.org/all/20251123092438.182251-2-shankari.ak0208@gmail.com/
> 
> ---
>  drivers/android/binder/process.rs | 2 +-
>  drivers/android/binder/thread.rs  | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 132055b4790f..db25307b5a4a 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -28,11 +28,11 @@
>      seq_print,
>      sync::poll::PollTable,
>      sync::{
> +        aref::ARef,
>          lock::{spinlock::SpinLockBackend, Guard},
>          Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
>      },
>      task::Task,
> -    types::ARef,
>      uaccess::{UserSlice, UserSliceReader},
>      uapi,
>      workqueue::{self, Work},
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index 1a8e6fdc0dc4..6a5c90547844 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -16,9 +16,8 @@
>      seq_file::SeqFile,
>      seq_print,
>      sync::poll::{PollCondVar, PollTable},
> -    sync::{Arc, SpinLock},
> +    sync::{aref::ARef, Arc, SpinLock},
>      task::Task,
> -    types::ARef,
>      uaccess::UserSlice,
>      uapi,
>  };
> -- 
> 2.34.1
> 

Hello,
Can this patch be picked up?

Thanks and regards,
Shankari
