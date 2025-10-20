Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5092F60DF
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954536; cv=none; b=DdxFvD/ZVj2SXPgvvs9vpAzd0s6vY/xKvwOSMAv/hOoQjgfvJmOXyfHs8Kbor23NF5t1nXTVNdA6a2fnEponBjtBJ0+sGoTH5hMPC5BPo8PmfGkGsT6rkLNNZGs0R700vUBtETMK+Qg4jU3D4PGlTf8tgKcCGkeZy8UPW74MOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954536; c=relaxed/simple;
	bh=YZmkiE6IYqORaoMB85+7KlwkNWG7iNkrs2r7JhIoc70=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aia1N8RoBB5xc2kKdnBSK6oHXWdU/G5nLbRTPnL2ZxcKWLUTEyf0VMtF/dCzA/qgqGFnjAlxBG4w/uNrGt5FAUdbancbZJGloIae6w6qoDXSVcBMKLldA+HM3Qg09PmY/pUY1abdr4C3R1ABmewYi2osFhwID6fWvU4kQAOkI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAjnA/rB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAjnA/rB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4710d174c31so45521095e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 03:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760954534; x=1761559334; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ysWWL2E0S+o4/V8T/pUjhBkANb8o2B4A/OaGe1c7O/E=;
        b=mAjnA/rBeGBR5DmmGPM8Snar/MNkeUrVWf8C0YkfclbNhrmVdCMfVgbFN1gvRgdTqk
         s080PaWY3dk+t5JBweYqHoph6yHFHPFRWYYhlUU+Ei9RJRSDhzSrOZD+oBdck1ANhd83
         kq6gnbfc40f8VCDVAEsOInjXbm4GpdS/MJ5s0Rsr4U63MhsqQed38zK3dInC1Dcndub5
         aOIAyG81HlucO0yEsZn9cWAEWxU4GqLul2mMpJkn8mfxQC1Fae/1JwEgqX8sTqkKo90w
         F1iANrlR7NnjPgH7BM0imdWBrn1N8Y6lqmkYn96KW8lzAlX6Bv1cYwg1fMCZSuf8OqLH
         HDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954534; x=1761559334;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysWWL2E0S+o4/V8T/pUjhBkANb8o2B4A/OaGe1c7O/E=;
        b=Zz9xPELVMa9V3CgdEWkk2+rNW6L4+i+0sCialBppfgBpbG+fy/iJ50zmsmcwRMRxTP
         LCVwKvGix1FGI2QL4gZ6XWXto4ZFJReRGSXACajJCxs6ha61yP7jMeoCLZ1iz0WM8zu5
         9tPO3KSwJ91DDLDxeVM82EBRlK3tzuiLin0qlEuWuxJ+FrRb28+V3sGVlD5TylIa1Oh2
         bA9MdXAhHoqG/IQxCLs+t9JL9vXI9HdmYla8enXKMSF29tqxgUMWAJEjqkwokvQ31rny
         2qMEWAIjGACJW1HeaVesbPIiSlpHFjgoVyvtBKF961is65BMTYWwBuwFgxJHsfdEX6c5
         7QBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+hHPiADnpj/u2m4fA+rfBabXU3yBG7YC7IvCLiAFoSOMSMv0lLl2G6lK2ABpua/wcmqVr++zpOM53iF+V5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7djWKC/QIdXQN25XoGbVCk2ENcR5wmo7+rXLgdWTkd2evqyGi
	dCcca9/7PjAxqGVi9f1xYwcBI0hiKBwBZSzN1K4MycT6IS+9V0XYycgK5SEbk3JjFw5gjA98vIs
	E4B2F2Thrkx+abjNXfg==
X-Google-Smtp-Source: AGHT+IE0ZXAqseWyjpLgReO0ii0OIASivJqIvkm0bcKlmn/cZWguLy7rH50N9m4LwhSIfhdDKruNbEc2euHhR/s=
X-Received: from wmcn6.prod.google.com ([2002:a05:600c:c0c6:b0:45f:2437:5546])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e86:b0:46d:996b:828c with SMTP id 5b1f17b1804b1-47117879b8dmr83149175e9.10.1760954533559;
 Mon, 20 Oct 2025 03:02:13 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:02:12 +0000
In-Reply-To: <20251003222729.322059-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-8-dakr@kernel.org>
Message-ID: <aPYIpGv1wDaKw5kn@google.com>
Subject: Re: [PATCH 7/7] samples: rust: debugfs_scoped: add example for blobs
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Oct 04, 2025 at 12:26:44AM +0200, Danilo Krummrich wrote:
> Extend the rust_debugfs_scoped sample to demonstrate how to export a
> large binary object through a ScopedDir.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
