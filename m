Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104CD337B99
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432729; cv=none; b=Lo6Qhy9Jzc5bhDq1YxS9paYdKr2c+b/zLkaO4zKfbBeTV+qJuJGJSqbMS2I+b9mn8k8KOH1iTYXIxHQyCrvGrVIGlIlXzjsAmXb3njxnUicjPhslqr/HrjkzOFTjX6gn6dOo6oDAZjTzJLk/CEr34Fi5W6y+8uwtmtTNNOVx4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432729; c=relaxed/simple;
	bh=GK1ja8KHY40OpYiu7CsA4QW7E7kCo73ow5VVlh2bhwU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hpbZvKaaXln51u2JULWybFGvw5vwqGdnA6J+h8RkH1C8/5R6zskstgii1q8xcb1B7NAUCvfuEB8y7K+tT2yYlKs5kL7hRsx3DaUiqeJyNYGzY5iPXGVaEiXhJ2wLLOlQStxHmTdzEbiJi4bHQCjASn7tgdMFJWGu12jpKJO45tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQ89ShHJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQ89ShHJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4801bceb317so48430305e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769432726; x=1770037526; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nDObQnK7/rlt3eIdqQ75S2Ut6SoCp4cXvTmH8r5QiGc=;
        b=cQ89ShHJKohnxj+HUYGLEohdGbqhOs9Zr3prg6f6hJsHQEKGbe2paaU2KfgC+sb+SM
         4zYxhJU+qdVXO8gi6qlQOTLUzKbXvvyPJkP5Dn+Zp3aGI/BihEWnyioMoTZa+fVkpoal
         H194H//iGX8+rfzBnnV7gG72lVSwCkikkwyKjIUf9d/XU+aRnOFlHJ4xJkVC0FnPmjiu
         bCrPFMi7DUwHYoKgLnTRdP75AA9Ut/YCQDGhKW74k3JRwkWYwATH7skIooPZynzl0GYp
         F6PSfR/9YGPYsi6+AfAOBOX0DknFIgC6T6nOx4LxBG94fqvDZAa9dMmJeYCvXnx6HBsw
         ZK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432726; x=1770037526;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDObQnK7/rlt3eIdqQ75S2Ut6SoCp4cXvTmH8r5QiGc=;
        b=Nrl+6+rH6tvltMLgQLRWGVP/exhTD0DveVswBoMLuWLc7R//8J/PY/xKu3mxQjT7cX
         pfDvTYi0uWaCxqu9VjouD8LSoeAV1fHZFIOAOnTX7XDfKd/SoBcmA1+f0z8QMZJQWBJu
         mj9ZmQpCfV1VEK2SYymvRWdezWu4KP2BPHHFaIWR3Mn1iv0r8Qxgou0phDN5oi92AxgJ
         W3PJ74cjv7fSh1nlNtDJ6ERQZ30ErHQHs0rAxOA33w7H4HIu2WO0H3Fq5NBrk6Kcee/q
         mQ0qVqje12a00QPKu8TOqXIYAV5m5tDK0flhB7Lya13UoMRlJALcrEHTU6Y00FlghdLF
         zXmQ==
X-Gm-Message-State: AOJu0Yy6tnItqWnFU1qU06evTLy7qX+ZsWrougxnF7Pht8zi6t2muISn
	+PuMszFiMteUrTVoiIfpudms9Bg33EjmiP9BO57zpeOO6diaXodTNdLWER2UDt7qBv0Z9D3B/U8
	qV3ofCE6hebOh8eCkHQ==
X-Received: from wmbb18.prod.google.com ([2002:a05:600c:5892:b0:477:55f8:e1ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1382:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4805cf66a5dmr68344985e9.17.1769432726477;
 Mon, 26 Jan 2026 05:05:26 -0800 (PST)
Date: Mon, 26 Jan 2026 13:05:13 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIpmd2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIKFblVqUn5iUk6qblpapa5SUmmRqYmRsbpZsrATUUlCUmpZZATYuOra 2FgAug+5rXgAAAA==
X-Change-Id: 20251202-zeroable-ffi-2beb542376c3
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GK1ja8KHY40OpYiu7CsA4QW7E7kCo73ow5VVlh2bhwU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpd2aQ02h1uFN9RndAVN7fOG/7/jDGtbxpG+H8A
 b0f7XIa6BGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXdmkAAKCRAEWL7uWMY5
 RvKlEAChro1KqzOPEgiDcDyVXAHYv6QXPuI8lZduEeYZWQzIT22LBX586Bg2T1aheLBgIjBPDIJ
 X8xB5BeAF1TbDOaBGT5zwXZOx8ana1fbAVrl9TlpSZCXstdyxba+28/JmtPVP4jq2yX7rMCKtXv
 k0CpuAfx3pkiOoSuoHp906SlX3b57lBgnSjScTaPZEatEbR5ZbeECZ7R/UhFc52GVHEgPNsCMH/
 i6cNeK3LCHnYQazcsAFfF2P2AXAqG/jxpjXUDG0MKJxGOebH2C6z5XEk61oFuT+8F5/wdt9v4Uh
 2Kj7JI1PXsNtfF4X9dZ2k7shJr/V8VtHkUvqAu6PxPxViNRksdMoxYo17aPegCUgV7HxpqGtSLz
 1x561v1QVvfy99d779o/ZeSw26UwjWeWm7fIljLOm+IWwIKt++oC9BrJcac7ZRUcM8rjbE1ZfU6
 YIci4+iqajTQgdwKCXPS9ej5eAN+xIgldeLdjQIHXmehTECvkVTBCnQapFfEshz4JfnXAynpEHX
 YWbHvoyJoimA/DGb/TkkJmqce630SAIdwSfls9O6DR2YhWqWj69toNfu2BNcuep477Ws0sou1Ah
 ETuPa3tuYbmhtQzOs7YMP2xRvAF+UiHB/2WhDWqAc+AvODtt9JQ/VDuPMvtCD27LjaKyllNJiu9 OEFfbdn/eIMyVfQ==
X-Mailer: b4 0.14.2
Message-ID: <20260126-zeroable-ffi-v1-0-0ef101d1ed85@google.com>
Subject: [PATCH 0/4] Re-export Zeroable and zeroed() from ffi module
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Len Brown <lenb@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, the Zeroable trait is defined by pin-init because pin-init
happens to use the trait. However, zeroed types are useful for many
purposes other than pin-init. Also, we wish to implement Zeroable for
types generated by bindgen. For both of these reasons, re-export
Zeroable from the ffi crate, which is a already dependency of the crates
with bindgen output.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (4):
      rust: ffi: reexport Zeroable and related items
      rust: cpufreq: import pin_init::zeroed() from ffi
      rust: i2c: import pin_init::zeroed() from ffi
      rust: acpi: import pin_init::zeroed() from ffi

 rust/Makefile          | 9 ++++++---
 rust/ffi.rs            | 7 +++++++
 rust/kernel/acpi.rs    | 2 +-
 rust/kernel/cpufreq.rs | 2 +-
 rust/kernel/i2c.rs     | 4 ++--
 5 files changed, 17 insertions(+), 7 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251202-zeroable-ffi-2beb542376c3

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

