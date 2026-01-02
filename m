Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1F2749ED
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767392630; cv=none; b=XhOd0v2FLRzTdb4/9mjKk9znyTqc7avxrnSBmbWBFf/S/hnQSPmG181IlUKGyM/wdBwMy1bH20S7pCgPUnNi/38HNJA+Hh/fBh8d9OZBKgjHo7+pNdqgi2lAd40vBdSuWDGsOAiGSjuZbCaQdZCUA6MH+t+yIKYJ4W0aW4UhFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767392630; c=relaxed/simple;
	bh=MuRhEVWL+gOrEEQBfVUVkBgbhbgBur/OirBCzdN8nf8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uNQi1Vj3XmfjuSeaLTzwXe3UJUNyEVDu52QfOVNEorl1+kbtST22cXyqa/TOTteGa1S1j6DGhOLOQH5W2Z76acph8+VhhHLu8frqdh03qm8AwwGhNkMBtDPXElmP3JwfBH1x7wyJqIk+/wEecH+EewfjFz+7x/mctah0e1V0Ndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRMs5wSP; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRMs5wSP"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfa9bfa9c7so8603976137.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 14:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767392627; x=1767997427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bo0vKrvksMZfjHEDZDUQ3ebKySUpVD/UwIy9xyx7kew=;
        b=IRMs5wSPxKa1iFuzwYDLCZZv72Mi9Y+ndku6HSLMj++Jnn6v/1IachZBk24+JtCwWL
         jP3TyTtAmejmYVdMwu8O0nGNEVb9wA+AEWbEHw8Z04cxXgPxy2dcGTu5C5j07GmMTqZs
         8QlZ0EO1X1ly6UT1zJ99Dvhp7zBL3G75n3AF9dxAEfZ9jcW8S3Ksz1JSK5GEStEj1sHi
         aq0Y/YUxBCK0NO3uWXK7Onrqm3glVyF28uy33TX88Z6WU+LskiKOxYX/z9WKc3ktVgJ8
         0btkbDMwlqPxwAqDVzM/WMzO9+xyWL9IF1FBr3Zj3trvpfWaN/NmZ+4wAeN89teLCwEJ
         ANLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767392627; x=1767997427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo0vKrvksMZfjHEDZDUQ3ebKySUpVD/UwIy9xyx7kew=;
        b=REGcsVDLIO7gAbtiTG9TwNL3VqQMOuxFwbUCVURwATdyiZbf6c7z3GH+27mwbk6YaW
         4GoLMG2L5TdjUTH0MXRShw3YtJLmO/XWQP4dAHfIQXTRx21RpNSk65f9w6SdagcWsxEt
         Y+nCUwbYvKVm1++AV4Yx45J9nsSUD2CbZaDzDW5Skrrd7bJLSASDt6wDJS881zLtQe7Z
         IuJ4BPYjeaemrK06tsHdR2Q4v+Y1EW87W3aIDuFZiw0M49BEFjq4ffToKcFzpIHgJsq1
         EOqdab/YwVoO/0NFP6hzHESJIFIMLEoI9GednmzEP9cX8+1Z6wlRBrzpp4qc6zr2dG5Q
         bl/g==
X-Forwarded-Encrypted: i=1; AJvYcCW331WMQpJNt0THWj49Zr16Yk6PbllzuiveUsPQM9uubTW5O8VHJ+EVXBt4AU0EewatEEHCuuvXRj25IqhiOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7pcEhBQaEhKpBd6qdkwCDIpR4LEMmfucycqR0Ct63tsuwSgu
	zEu/9kDvXvl5rpFDaqgkIAJ6JRso/p8CCTx0BayBWdjfz1LaZFJfhZURD3xO3Q==
X-Gm-Gg: AY/fxX5K8rktif6cHhUmdcd45tz1+NSv6kKsk9Kbe3lsEXMBVx55DPj7IetFmKGtxv/
	Jt4UzJoCNcKTsgKBjltZqwmLNRlNW/p3YFXB3ObrYjPzPlMxRTau7z9wIuRaj+s/I3IcLXuza3Y
	teB265ysbUnooggO6dWvaFLp+Bezu8Jj2OrVkJvSO1gWuAeYS2130a9mzHAkBFa39RoGIZ2o0cX
	eKcGmAWCr0mVBeoIfQSid/PeFIUNmm0OmCNJOYoxWSfCaRse5FKZLrGuL3PDsp0Yp0XtazqGAaP
	s80bKqofdcru5r6MCeCqdre9HrLDx+4qbbxcV3w8DXHH1YKDiJEBucsUcITdMeKZnw4dFo59xbL
	5A6vKLUpXhSWX4cm/J203ABdhQYA9EihuGrHLINLuD7gqGp5HHFAxdl0uSUhZ2znCTCWKjyclGZ
	P2FRd5BUEaUSe4ktQZBAs2uVXsUYbbxg==
X-Google-Smtp-Source: AGHT+IHVc5HlpUqLS3aCKM0NNR8DSr6MIhrq1/whlaHDzwyZ+fh4p5PMmYhEx/XvFmeZHF/Dm/g59w==
X-Received: by 2002:a05:6a00:3021:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-7ff648edfe0mr37042165b3a.23.1767385662701;
        Fri, 02 Jan 2026 12:27:42 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:2123:b1fb:b93b:b5b4:2357:c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm41163964b3a.64.2026.01.02.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:27:42 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	"Todd Kjos" <tkjos@android.com>,
	"Martijn Coenen" <maco@android.com>,
	"Joel Fernandes" <joelagnelf@nvidia.com>,
	"Christian Brauner" <brauner@kernel.org>,
	"Carlos Llamas" <cmllamas@google.com>,
	"Suren Baghdasaryan" <surenb@google.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alexandre Courbot" <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>,
	"Igor Korotin" <igor.korotin.linux@gmail.com>,
	"Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
	"Robin Murphy" <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
Date: Sat,  3 Jan 2026 01:57:10 +0530
Message-Id: <20260102202714.184223-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending the v2 patch series with changes suggested as in the 
v1 patch series [1].
Also re-worded the commit titles to refer to the target subsystem.

Have resent only the patches that haven't been picked up yet in the series.

Thanks and regards,
Shankari

[1] https://lore.kernel.org/all/20251123092438.182251-1-shankari.ak0208@gmail.com/

Shankari Anand (4):
  drivers: android: binder: Update ARef imports from sync::aref
  rust: i2c: Update ARef and AlwaysRefCounted imports to use sync::aref
  rust: usb: Update AlwaysRefCounted imports to use sync::aref
  rust: types: remove temporary re-exports of ARef and AlwaysRefCounted

 drivers/android/binder/process.rs      | 2 +-
 drivers/android/binder/thread.rs       | 3 +--
 rust/kernel/i2c.rs                     | 10 ++++------
 rust/kernel/types.rs                   | 2 --
 rust/kernel/usb.rs                     | 3 ++-
 5 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.34.1

