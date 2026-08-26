Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C03C13EC
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761905; cv=none; b=JHUmRASs6Kqp1CyRKugRx37GE8G9oiHZ2FTdAwyVgUylrDz4uJkIQhF68lFHHOfnYYTxMg6NGr8R+1zjkhc+dx0rEU9EFINW6TWaLZLwS/XrQUHtRpKCUKpoofs8eOI3lEMQz4uCxgGhjY05vg4PyXvtTP3LeLQS1zlditGJGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761905; c=relaxed/simple;
	bh=5JUivoyhL/eFA3z1wzR8eXGOYWpIX0QOjpm+5X1M89U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrTiQeVCwl+aRLZzkdASjgCo88MdjqISjU/DYVcw8CROSRmlJCBaFQtGhtshIF4Vvey4dxhLRLrcHxD25dROObI7vgQSdH5Vab4I9dyKgL8KM6oDPbiS3lKuiN2Q06yjirs3M9FaYOWHFDaltx4Vcf2wSaBKUIoRDCid0pXxFv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=l62fSSEv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="l62fSSEv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10242575e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761902; x=1788366702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNZLQEVLi7AF6T2ecrRF6uxN2Gce7/nJnEoP7xr5640=;
        b=l62fSSEvzQydR0K2XmNXurF14Z1QDh6NOUaQb6k3XHtpC5Mc2i0ftZr9eCFQz3LGqJ
         35qLKyJcYAtBTstIB+MZ5AhR93Oy4Jkgc210QFpZyDEbxib6BagpUANnmNTf+S0SuaA6
         HQs+Gp0GoRidk5qsHihxZPjY4LGBS/I43nLC0GbQC3aJ+06vP+fpOraiJn3b9+pvJA+m
         oWTkDDAF3fd7DKzP3N83GogJHZYCpCoialvtR2hP1PtUg4IK41ZOKKD6jYXfliNbS9g9
         61g2q2AJiwnWVla3Hf5TjoaEcVMdaCqpyt2w+IxFngIXttgDZgkbJiBe7ILaV41xETUO
         olxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761902; x=1788366702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNZLQEVLi7AF6T2ecrRF6uxN2Gce7/nJnEoP7xr5640=;
        b=Fkh4HUD4LtQtixxknSThbUDwjjil7jvI3/IYOC7BO7ng9qtcGqntfCIXhttjNWKWm0
         dJkU+Cb3EH145SDewnaINRpXraP87MosfTn6bRGsBZGDfseS6V2RWlboLqhAaesbYLCi
         qFElRCVvXxAid99h+FhwpScn9l/Z/jdEvuc/d59w4BKI21PsE6oyn0wccGYtgMlh53U8
         /M2Ndwkb3yg6FQmNhGsay+f3Irszfo+O146+T0V2x0cgOaNdkY48+LFbH4UxYAvoGsL/
         DVX2SA46FCoU1h3C/xY+3E84FeH2MOWHqsyizDbsJNEABdgmrjldcad6/N8U9NUE/hJm
         qBaw==
X-Forwarded-Encrypted: i=1; AHgh+RrwLczUIN5avp5g/B+CAkJilMjtQwIyJ2pFeSI73qWvx0PftLlWcDI+P4I+bzf6G6eBxBQy2mTJdM9Fl3+rJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lt2Y4ViJbLuB1I5+Wbj/++xtFTYKuJLs7+SrSOIHg0iM1M/i/3
	5L9RNu+ZK4rbTSRi3qpWWwSr3EOxOc8BSa9faq49Fha3eSaTyVrJhJeqqQ3zGoXL4Q==
X-Gm-Gg: AR+sD10ZtP2p/J09xSHVPijqXu9nipRlCyTUGR4R4QVhc3Mm4pJ0TLas+yGFCYVvuuT
	sNVcgbwe2G/WUdtqMcLcrXn1AGWufY2qrkuMiBf2xY2OhBBA8VclgPcIWseQ9faRV5InwJqInmR
	b3T7KfDREQa2grmobcswvFV2gvgisPQUDFvZRXrKbp0IGAuK6KJD6UCL3YiJzh5swOFhGScY4cJ
	LLzaWVSBy2gxXjPcudScGtnub/a0XFZaCZW7US++O577V/IUti0zlWkGNOrRvU70KL7B5mUa/ZA
	ZZn2SWls1n9oO3KocMxgLwHAyC7Xr3T+TPUFvUbKEI8KtKYaeH5zG1+5qaWMJHH3JazvOuugkYK
	pWQPtmPahsuDhzWOO1itUA5/TaEj5rFEKlFiwgPZXT4VWqbXEr75T4q67SYraGq/AC5tVoMaqpc
	MClK+nghlbZfrUnr67RjZJxpFdA9aynu2BP8fTjmmV2mUFZXrPVEaNKKoRKO6SquHfe3aCI5/3J
	I2gXLN2V0NP6xLoKOl2UFNAnrzUpzBL8J99
X-Received: by 2002:a05:600c:860b:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-499dc6e0040mr88950875e9.1.1787761902407;
        Wed, 26 Aug 2026 09:31:42 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:41 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] rust: usb: let a driver keep its interface usable while unbinding
Date: Wed, 26 Aug 2026 17:30:41 +0100
Message-ID: <20260826163101.4168-6-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB core kills every outstanding URB and disables an interface's
endpoints before it calls any driver callback. A driver with something
left to say to the device on the way out therefore cannot say it: the
transfer names an endpoint that no longer exists and is refused.

Expose the core's soft-unbind flag as a driver constant. Setting it
defers that teardown until the callbacks return, which makes cancelling
outstanding transfers the driver's own responsibility.

This matters to a driver that leaves the device in a state a user can
see. A display bridge that simply stops sending pixels leaves the
monitor lit on whatever it decoded last.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/usb.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index b2a0fb104ddf..1d8f5bc8a545 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -107,6 +107,7 @@ unsafe fn register(
             (*udrv.get()).pre_reset = Some(Self::pre_reset_callback);
             (*udrv.get()).post_reset = Some(Self::post_reset_callback);
             (*udrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*udrv.get()).set_soft_unbind(T::SOFT_UNBIND as core::ffi::c_uint);
         }
 
         // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
@@ -474,6 +475,19 @@ pub trait Driver {
     /// The table of device ids supported by the driver.
     const ID_TABLE: IdTable<Self::IdInfo>;
 
+    /// Whether the USB core must leave this interface usable until the driver has let go of it.
+    ///
+    /// By default the core kills every outstanding URB and disables the interface's endpoints
+    /// *before* it calls any driver callback, so a driver that has something to say to the device
+    /// on the way out cannot say it: the transfer is refused with [`ENOENT`] because the endpoint
+    /// it names no longer exists. Setting this defers that teardown until after the callbacks
+    /// return, which makes cancelling outstanding transfers the driver's own responsibility.
+    ///
+    /// Only useful to a driver that leaves the device in a state a user can see -- a display that
+    /// otherwise goes on scanning out its last frame, an interface that must be told to power
+    /// down.
+    const SOFT_UNBIND: bool = false;
+
     /// USB driver probe.
     ///
     /// Called when a new USB interface is bound to this driver.
