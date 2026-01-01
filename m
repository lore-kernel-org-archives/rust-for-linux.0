Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF01F192E
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 05:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767244894; cv=none; b=vAuJPMEMUQNXARSsWDJmkvbOqw+RPjEc52EHfjZAnYHYG/m0umrrh5cRXwaEd3fXwxZRmK8WBOI04CDytnykT6oOJYwNDhoCUwDyIHmQ2q9SC05cnBfJkpOh1WxHc6WsCUOWI2PDnYtnK4lw8jUHctb0RA3ax6VdloDtaVfM8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767244894; c=relaxed/simple;
	bh=oU8AXbLPxfdc2yPuZDO/6a4+snqR12Lb8r8RXRuzo3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOSA2lTMu6UxfAYZ265JQCmmxNWyaYJMb2MXOfBHS37f8GFqfWDp0gKi6342S0rA0hY4hGVYA+Eq2e3IDpYn/ZM8l8v0VX6HC9E5XDY/nmOCwN4oDXFb5pd3PIK1KueqUoRzxndw58d8n+sbb5ZMipIwBvHIuIpP7xTEFysy0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAoxeEDV; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAoxeEDV"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso120104651fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 21:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767244891; x=1767849691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHOwRzURK3HvR3V48oWkPaPLxKL+jt3ZSgRna/0IJ4U=;
        b=dAoxeEDV4GElskcjlC3fnacaYdAKC82LNc/oN/g0rYBPStYWlIJmy1Kw20o85dtcbz
         evawp3YLd6O51yoEzEBKdD4KiAm9Sxy1X4mGgX3WlzOecZHRObdYdCHxDpOLR86XHeT+
         lKpM+Z0cuLTO1Hmzwn9yyhbsNiEEje5u3tcnf+yYlcnfR4cGjFtedpRqsdP7Q7EKwOap
         x7wsilHJx8xDFNmVKCNiXtioXA+m4mrDHBBJ4o26o6i7+ahcIu72SBS95Sw11UFINBpR
         XV1E1mF7vak2XGv99xdifiVHAMeY19lr4l3PNWDSTMtnNTQbWNeUFpiAX/t7vn3ZjkUj
         VXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767244891; x=1767849691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yHOwRzURK3HvR3V48oWkPaPLxKL+jt3ZSgRna/0IJ4U=;
        b=AnFlcKWrdhLZJJr3MV09fX1Dtwn75UEi04yBTHQ0T0V1Da19QyIzIgE0FYU4mR2Jv2
         OiA1sZJg0XA9fEK57wL3enticJTxpouPFn1p8rQvz4+NeOP63+EqvpJnz3tbZrNGTij5
         OnUyAC1t/FbOZLnH5FRmxf2FR1lX6CuqVWbsATt0nixlzTCrXaz6cqzsboGkllwGerL6
         URQc4erNUFZphC03Tuv3UZmi0NOBTo8ctrLb/QCdFcQy36thJHiqAEPeHnUnlDiYc8yR
         OJsbYwyt85yTuN8UB1OVfrRNOgdCh2NqdK4qbVaKoBR+fZZfEIMKRq6qGRCP/y1jlcoq
         86Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVmw/6GTiT+A7eDjMZR/KZfH8tt9z368evJcv79l9UMIsLQsGJ+x4Q2TqGXrCwcGh0Zklq3nR1GbZLFs0HC0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZid1jc06ogewFft2Ji7UdCQaa3bOoHRhXYmPI2kteO8E6vIP
	Mqr9oUuRQRSkTy9g+Cn4JJmm3Ids8Uu0T8VBytq5C78Nj/86nm9LAKy2
X-Gm-Gg: AY/fxX5VRxuXTpji3m7h/G2zOH4oPoGVu+IfFXZcmDSqagQgSyII5UUwUaqfAZeIxqn
	rJRY6fJK5DRhhsVIQI2ZYgglTpK7i2xbu4eF6lP+s+lO4U+3xgJ3VUX86B84igskY2lFIADGAtj
	Ggo2N57ZVFbge2BvJElvBPMVwHj6fwJlhrzaYTVhqMvXNT2MVx40ZJ5G7e1wDwCMEVOIp2VoiWR
	lrGIKV4Dgqh5Fncw8G7N7C5MxGN8MacTGa6P3J85VPINPLp95wuAEEBPlIv3lpnYI7iNF5FOyor
	Hte9uwUlKnHlXy7Eiujbc/RUm0kIN9aiQ/l3hoLgzHPcGh637Kef513U+Sq3MmPXmQpIGRvdIDD
	j+e9X0FiR7SaWku4qgWGIMd2vbIzOldBmvAx8ulV7zldUm9phId0qR3I/bgbWgJM4gLtj7B2isc
	yge2Fju6/UGWqgxamfJ2VnpnMzUp25ZgDOMQSSnCtuIcKdHym0drsS/j8R6Ik5sFrVO/7C01/ci
	AcUGw==
X-Google-Smtp-Source: AGHT+IHEv+kPqKymr4VXmqTi30FJOewT0NTEHSBAdMfCqJgglKj7HSTDJFJDDr6fr8BgfLO462XPUw==
X-Received: by 2002:a05:651c:b12:b0:37a:432f:8ecc with SMTP id 38308e7fff4ca-381216724dcmr135823501fa.33.1767244890832;
        Wed, 31 Dec 2025 21:21:30 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-216-54.bb.dnainternet.fi. [84.253.216.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382861ef4ccsm37064921fa.23.2025.12.31.21.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 21:21:29 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 01 Jan 2026 07:20:45 +0200
Subject: [PATCH RFC 1/6] rust: Enable const_refs_to_static feature
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-this_module_fix-v1-1-46ae3e5605a0@gmail.com>
References: <20260101-this_module_fix-v1-0-46ae3e5605a0@gmail.com>
In-Reply-To: <20260101-this_module_fix-v1-0-46ae3e5605a0@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jens Axboe <axboe@kernel.dk>, Kari Argillander <kari.argillander@gmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767244881; l=837;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=oU8AXbLPxfdc2yPuZDO/6a4+snqR12Lb8r8RXRuzo3k=;
 b=IGihzG2buaIXq6V07kPH6f84Q1eDKB0tLDVGw2tPrNwji1/UqRfEH5cLGqRiecwlWj8R9P3WQ
 KHN72I+wjixDD6J81u60QyxyE/AWhjyCf1H9TuHy54eIUeQ2OQ04qoX
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Enable the const_refs_to_static Rust feature to allow taking
references to static items in const contexts. This is required for
using ThisModule when constructing static Rust structures.

The Rust support already relies on features available in Rust 1.83, and
const_refs_to_static has been available since Rust 1.78.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..69a798fbb563 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 #![feature(const_option)]
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
+#![feature(const_refs_to_static)]
 //
 // Expected to become stable.
 #![feature(arbitrary_self_types)]

-- 
2.43.0

