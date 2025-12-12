Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74A28B3E7
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581308; cv=none; b=A2xwvKThJmZgwvaiMUh6IaYuh9iXMBJEE7pGUjeRq8EuoOzx6IJr8BHEJGUpPsLNe/s2TJRzMbIr7dovTJj7RIf4W13cTovXWERQn/PCCwaaVZA9e4M+Yzxf/HRRxvRR711nCTfOH09wWBlNj197hleVRVIQBBM2BCFB3NWtYwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581308; c=relaxed/simple;
	bh=grVCYpNW4ci248SvZI0xIvflqMWrqgIT7rwwaPbZPck=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=H1Z9+oYyWN/0W2FtqTPcavp/YmiWZmpaEnWfkGnN5yOn+SdNiU9Ge7vVHeXSqRWB5m7+km7QZCsdtZ2+rB2PUQJh+rbCkmAbEII/0IF6cpz2zL5KCgGmEeKyNPTMGQCzCk6eaHG1XUty1yFQdEYqVrACVyZAYV+vGTv+QPBCVAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkn0Z/u4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkn0Z/u4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so1711031a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765581305; x=1766186105; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PfP/MBtH4NfH04n7zsOljmD6bQVQlW9uFmWTMwxJ9lA=;
        b=rkn0Z/u4cmaQ9HeqBpla0o8pVotPEe5SUWEyVYrhnC+wMip+lsY449IW6CO/WvPJqU
         OAz8Lr2dg70Fl71CfhJUpWUSXSyWre20i2j9oMx2VKy4VWrZ8VmtT+XuioIiA0T5+quY
         w0972j0vo675aV2XsAIVjFp5+aRWVo5ebtThLZr1kiS796UaSWUWDPmN/EefpSm4ZV/r
         6arNEr0Yyu4K9GVFRPY7lNmoWUGmvLvcogipBUKwJfstcW3C/hUQOrjn6WDrWkzSUUq5
         z3ZZYgu50e0XAA2kNybV9/MZNkhny8eOSTlj2DCb3BTwQPs/VXecdpX7g+MK7A9fwMI9
         fhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765581305; x=1766186105;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfP/MBtH4NfH04n7zsOljmD6bQVQlW9uFmWTMwxJ9lA=;
        b=gRTV/9i+eS9FGMzWa+pSMaM7cbscCEjvWZ9yRtuxZjD0aAmEiC32C2rtaj8gz/6HJv
         XkqY+DJsSMbwMlKju8NR2ZHSOKUC4glao7agAineo6YnGfDU85E8Y3VzDfDZWoAG/F2W
         Bhl48c6Ph/v+pxX7mE6WZgUuMlPIK0xuddTZcyEsuSrb8Or4P8EnEwqPwD+NcA8rdiNd
         QBSUeDZJhhZFKJ5taZwYiEtNEBgBuzxb6Ee1q2IDq4h+JPMLm8/cm+6NXD4ahgmDcEBd
         rK4FxXRrGuUyL9kHeOZ/6vFU7CFBspNY5LPiU6p7LQfWh4Qv0Kt1veZnhFpBG10ijKV8
         953w==
X-Forwarded-Encrypted: i=1; AJvYcCUvS0u1DpvwbDDz1NIo21XvbvCzU0tI/IcXfbxDFPoLVPNt800GdIXsMHu361YUuIP3tQYEL031QwctlXffGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpODI++o7D66hJEgSE0j6a8N8NCA1wMTzn3DutwNqX7fG3ytYF
	F1n/RdZ8HrZpufwMfjRbyPnILTf3woKy08afqrddy0C7Vel1c/wss1SFbxeyltiJO8KB1r9Gaa9
	Ds8QWzF/2kA==
X-Google-Smtp-Source: AGHT+IG9aR7Q0+GQpaoqiXYqPmHtBhbLPwpZbiWi/9rQZljjLrdpdVUyTILU8/bULkU75h5d3razC0Y0ZncO
X-Received: from dyek40.prod.google.com ([2002:a05:7300:6428:b0:2a9:99b4:ca53])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3aa9:b0:2a4:3592:c5f0
 with SMTP id 5a478bee46e88-2ac301ddf9emr2115454eec.1.1765581304958; Fri, 12
 Dec 2025 15:15:04 -0800 (PST)
Date: Fri, 12 Dec 2025 23:14:54 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO+hPGkC/x3MQQqAIBBA0avIrBPUiLCrRIt0JpuNhgMRSHdPW
 r7F/w2EKpPAohpUulm45A47KIjnnhNpxm5wxk3WOK+lRB04I+ck2gczjzZEDITQk6vSwc+/W7f 3/QAjZpFwXgAAAA==
X-Change-Id: 20251029-soc-bindings-9b0731bcdbed
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765581303; l=954;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=grVCYpNW4ci248SvZI0xIvflqMWrqgIT7rwwaPbZPck=; b=MCPxCJDhwFqUHKoyfTynxsLLyWb1oXDMyvEhkiXxjZR4kdDdAt4HkXhN2ST+nu3N/RVz1Z+4C
 LK5bWfEvmIiC6CjsLDPZoQ9FN5Hctb45sKV1/S/rmMklQstbGmMvPUX
X-Mailer: b4 0.14.2
Message-ID: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
Subject: [PATCH 0/2] Support exporting SoC info from Rust
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This is a fairly straightforward binding of `soc_device_register` and
`soc_device_unregister` which allows a driver to export basic info about
a SoC.

The second patch is a sample demonstrating usage, and can be dropped
without issue.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Matthew Maurer (2):
      rust: Add soc_device support
      rust: Add SoC Driver Sample

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/soc.rs              | 137 ++++++++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  11 ++++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_soc.rs        |  74 ++++++++++++++++++++++
 7 files changed, 228 insertions(+)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-soc-bindings-9b0731bcdbed

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

