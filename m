Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025809460
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772897212; cv=none; b=OqtxHJ299g0kwxuH5C1RU/K6TpciH5Chp5RRKtnQ615KHtU9hpKGcKPNDZEhqeNMufhwAglpOwOClK/ldYku/6GWm7TPxOeEALSONGNp4len6devrZf0OvYvKD0lslMFnj+5NQLeoKxIEtHkJjIT6/acJG3QyRGxvO+yBGsT2eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772897212; c=relaxed/simple;
	bh=HzJG9VphlnI2o+NaSPQSdVkEilK/Vxmgkaou76p+uQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nn2YvNXbKv4a9qVhKX9WotcVpZQN21kdB0Uxjr1R3xO+Pd3NZQQJvSya4/YxrpX+PvtQ6JbAo9WK97B/Pu2x37sQ4r28DGJzoeUob0YCgvB8CE/jGfKj9VyERnVi4IAaJbfwNLHMB0wO35n2hBedsR1gq2OZ+KUxpVmDmXYiEGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8vnF/RL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8vnF/RL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2addb31945aso73670275ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Mar 2026 07:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772897209; x=1773502009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byARshYttLimEU51kozrx7eMCOL+frdJ+wd8sMWbMnA=;
        b=N8vnF/RLq+pQ68wvvrkVPCBKVVD+bFgzXFEeJXLNw0JGo3yDB966v5xV27nVM022/5
         yu0m9MQReAFjwruc/sfkdNb7nkqy9ZLdtB/gfoqtNLDYCScMiHEgDcmIslZ+vMTw6TLw
         ULp0EC1MbCS3zsaFVSamKPVIC6GEG/YzWJOei6TEOoGUXKdzD5bO61jhpfYG4YT6rQ9C
         B0PpTmrItMOOWEmnCe8dnUdp34eJKlV04D1L/6MI7lLi/3Jv1muPJZ+8sWxFEb0ngcHe
         RWdt4VJB0+jjcxxUCDGaGUk5XGRHwkNvomJ78sEtMYUiR9p4zycieCwUWIYA0QwUQDKn
         UX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772897209; x=1773502009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byARshYttLimEU51kozrx7eMCOL+frdJ+wd8sMWbMnA=;
        b=veA6aVQfnnVpVr4rqKCQYevCEtiP1pw2ZNdyVsLfEEKCz7/PDiD1/hHoMzuJJpN1a5
         MmbSC9XB19bxJJUxExxC+Y+uwR2ABVYt7X7a2gqrEilHuWmNP/zIKJNClW678YlDDASI
         lrgcKlL2yxrtSXR6HO+3J/hfU67xzLUJSR/9nuQ1mFOe9YSWgfAudzLsUsFOm3R8Qtg8
         Jzf8r1EhvGrGUbOc030eYMHh0DMW8gEjLF29XdijoBQR7yqZpx+ztdzjgBz2k8J9U+UB
         86nTOQGyduptMdNLMGPLsqy49Ep2ZM8Y8bcuNROlb+/PPLmfoYHlKmZV0zgh7xiFFJGm
         Jsqg==
X-Forwarded-Encrypted: i=1; AJvYcCWsN3hGxYzEexPN3Lp1bW0vncCSwmFX2Xd/zPeh5rpEMxlfNggRzdZSNCCBH8AR0ZjvgkA36+Umk/YZEbdFPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFe/+APeNbpxrI1Rf6mrWcJqsHPY+XHSd56YjKJ0zYrufKvxP
	2jW4GxHW4z68KOvznx+TKUTt8IIWOMQ8nRlcshV+SMZcwwFVvcb5YI7J
X-Gm-Gg: ATEYQzynrYdUrBFPsGAJlFugubUQkx2EeUvlIq5Z8ER0yn81YG8+7bk6iLMR7RZcnht
	iluTfOZHnHmdiRzpu+KOIGaROBvlfdm38EWpCuTr2UEB5+rHRyGOQJ+6jw8AUO9k1tvj43Nqs1V
	nGfksJc8TBwO3Leld/HlyJMt0SvFg7L2bPRZ+R57VzlpAi1xirvYAKInM/7nq7ZGLys5UjIah5M
	2UsqqRlymiJ/9Wyq/TRTLlEi13+DMY/imur6RImYrq0+ZH3LP+8SXoMPZYsEZBnAyK7/F3ovKKP
	GQr+kb1xfHz2peynEN7BJ4NZL3FUWqvJBgqmfjTI+4cEY7qXQFknlUgXocFuS/7VOzhL8Vlrpck
	D+aE3iIEnV/6ofkcYiPVReovZxDyzRQqI762yePXkIyaJiHNIHxA5oG0Pjzo6mmLpauOhNd5EN7
	4s//jDBSL9XytUbzGNtB2J+AQVPHdfHPPhBxbI
X-Received: by 2002:a17:903:2441:b0:2ae:425b:b3f8 with SMTP id d9443c01a7336-2ae82466e85mr57906625ad.42.1772897209328;
        Sat, 07 Mar 2026 07:26:49 -0800 (PST)
Received: from shankari-IdeaPad.. ([43.247.145.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e584e5sm75313185ad.17.2026.03.07.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:26:48 -0800 (PST)
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
Subject: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
Date: Sat,  7 Mar 2026 20:56:33 +0530
Message-Id: <20260307152633.8205-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102202714.184223-1-shankari.ak0208@gmail.com>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jan 03, 2026 at 01:57:10AM +0530, Shankari Anand wrote:
Hello Miguel,

> Resending the v2 patch series with changes suggested as in the 
> v1 patch series [1].
> Also re-worded the commit titles to refer to the target subsystem.
> 
> Have resent only the patches that haven't been picked up yet in the series.
> 
> Thanks and regards,
> Shankari
> 
> [1] https://lore.kernel.org/all/20251123092438.182251-1-shankari.ak0208@gmail.com/
> 
> Shankari Anand (4):
>   drivers: android: binder: Update ARef imports from sync::aref
>   rust: i2c: Update ARef and AlwaysRefCounted imports to use sync::aref
>   rust: usb: Update AlwaysRefCounted imports to use sync::aref
>   rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
> 
>  drivers/android/binder/process.rs      | 2 +-
>  drivers/android/binder/thread.rs       | 3 +--
>  rust/kernel/i2c.rs                     | 10 ++++------
>  rust/kernel/types.rs                   | 2 --
>  rust/kernel/usb.rs                     | 3 ++-
>  5 files changed, 8 insertions(+), 12 deletions(-)
> 
> -- 
> 2.34.1
> 

Would it be possible for you to pickup the 2,3,4 patches of this series so as to
complete this cleanup in one go?
The first one has been picked up already [1].

Thanks and regards,
Shankari

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9caa30dada9e8ec9b1b09cf95e6d1a806c86d101

