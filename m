Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267307;
	b=2f7GwGqT/q1QeybS/DKfM/HHeAt9rK2ZR+PKo+omL3vb/j5rM7towt543iHvJdNUCkGd
	 ZGnN6UseveUUPRbOfG54juX0WMhB2VlZdzYLQD6XufYjiiW+di/9IG0XdUx6h4rJryKxJ
	 hvQk9tTyxv9mNL1jzLx3KUZnfZu7MOTrcKLco8txgamR9+Ib+i+CkN24juz69S6//6kUM
	 46tkc27pDmtfM4on2c7X8ZziNNi/shxH9Mikarj2qMk4+XWYOorSty4SQXlzNgGJqIi++
	 o7fSa60n47QYN4rmcs6/oHzYq7eclxeGT0Et1NyPeL1ke4CNSydiOY3KocRTWqmw/9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
	b=O7Q8e2piuGNMrpgjvbWUaB+O32xmci3PhxGnWk+uW3bz6r+XomeQUN6KdNs+nn6CLjce
	 81KF6Y/21nHsEnIld5GoTj+gINw2TemrieajpMXq4b7BI0EeCWb1Mdhp5m26lFtHfgrtP
	 jwVTBecFedz+greGA8AZrGlWdkEA/Z6839bKy2TXfYgqkXadiFkPOqwfx1B7ARENXhXi+
	 DPcxwHR0dlLvBCuJGPsI98dDanFXKWPhit3QS4IYkgMHp0SNSXyS92GaSSSw8r9kmcdXY
	 dy/qmDerod3cPqyK3FMaXcfiAmy6xtnZZtSwZZsseseQ8yVQ938F8pKdJLsCbIJzP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F2mz/Op9";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46DE606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 09:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F2mz/Op9
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df730c035so1213132f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793267305; x=1793872105; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
        b=F2mz/Op9BfW71oImSpDkMRFAN3aPWMxH7P4CDZWVg2SMGv07c1UNKMhBNsuKb90e6L
         9rFF8ySezG5ia0PjfPUd2suvDmhl0XPBF34cPBPK2dyG+aDW23lpguMVM18WxSGz9QVZ
         zia0FflQtfSCsN7yvrOWG2o/wXgj7VL8aIrj/V4RLim9tKejJ9bX2u20X2oqKxkTmWJM
         nRzKVrbl59tuiDgPVYUNDGWBmS8TZGiEVE1bqZ/IlNerMs8aDcweFwK1zMzYNBDMBMg3
         LZJDAZgZSOikYKT3Fbt5mNdjuSIAeJGBJ0KflEAyPex/hzs+89cWCojk3qlfN0TX5LOw
         hHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267305; x=1793872105;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGbueYQO3ZHl/HehdiAMR3NdzwozdadRj7RvSHj/9W8=;
        b=ApARiK90xQpxdz6u9eMLc+f5eHK+pzbXaifquS5cp9d2UWgjDCsyUZ09JF29bnr2E/
         vBp8mLrXGH8BPmv5m9Xz6+iQJMOXOBpfj1L7v2Xbpx1waYO992Be+7kFQTfII4z40Oum
         pISr5/V12aWE7tcHbUq5bWHlkmsc5I1y129ugXx8flxa8R2IcmoB+d2Vql7ylsp/Qb80
         44HG90f+lFlNJPHMB+OcWq9BJxVb7tKSUoO4KqcLMrrr3dm0tbEDOCmdcO86BG+2bb/t
         XR9QQbVn/gxGfpKSVC9rCsXaguFEdRcs9D2s5y7dwLer2vAo9Qf/oFEV5bh+SdERS8O5
         qNZg==
X-Forwarded-Encrypted: i=1; AKwUvBz2i6syXIP2G4mGqkHIfOQP6eVFMd/UNAiWOvUoXn0drrtAfN2Ue9566+ZoaDBIBhVqL/HxAwVF5CYuIVDojA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqXwW9iV0Fsnt5hUtHa1jbX+Q7hSINLoYBp4/ScYbX1wOcv1BR
	8GNTt7Fq4b2/oA9X5sgIglkzOjHQmj/1rgp7dXbJsduiuL4csbYNblmh+QTl6p1WoCWQz/J09/p
	ipkCrRc0ew1x8QuuKdg==
X-Received: from wrvs3.prod.google.com ([2002:a5d:4ec3:0:b0:48d:eee6:b19f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25ee:b0:48e:5fd8:5822 with SMTP id ffacd0b85a97d-48e5fd85ac5mr9739933f8f.18.1793267305063;
 Thu, 29 Oct 2026 02:48:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:48:23 +0000
In-Reply-To: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
Message-ID: <auMWZyxtC1d_BUgN@google.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 26, 2026 at 12:40:02PM +0100, Konrad Dybcio wrote:
> +#[no_mangle]

If you use the #[export] macro instead, then it has the same effect
as #[no_mangle], but it verifies at build-time that the signature
matches what's in the header file.

See for comparison:
drivers/gpu/drm/drm_panic_helper_qr.rs

Alice
