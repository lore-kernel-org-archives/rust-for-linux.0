Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5946267714
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761395058; cv=none; b=Rp/KSLXb8ikWWao1VYSBkcRWTpaGGc8jtw5/MPfKkzy7lyAjKdbRzIe56OTAXNFVQbiW/L1jGiG/x8ZtWW0ZFIdwkR3B3HuGltFp1OaD3/Rn1gzQldAbxWku5K79sMIOABMcXlRjv8inKJbs2XajbcuoTLqnyLaV7SZPdsBaFSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761395058; c=relaxed/simple;
	bh=MaumaobUbQQd4lPrGDKs71WR0+BDt21J7MK/9q2ksaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UCKOiEuSIcPcQVDKszWaTnZs0xJoR29gmzE07wBVTvo/IFlxYpXM99qYNLm/bz4QGLawkTV2yp8TjhdaTC+Im5kBAODPcFmfTofsDYcgNLksQBMiX+sPcx+3N5APHhzEwH1yJwjdJpku6/MnCKer4LOr1s8565Odek9qMzg7VE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v1KZxjN0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v1KZxjN0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3c2db014easo656889366b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761395053; x=1761999853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lIsQKEoKbxbEkb+kg7sVbRygyGKcmH9a6HQvRcu2oQE=;
        b=v1KZxjN0PhgSuPcQIE4cB2Mvy2Plwc4YQNIEItcAMMgBjBx73ulv4R4luSGcos1COM
         PmWVpsPrCM3NBeJc0sGru/IF03o8mLm9mxaT44Ihb5rS8HDuM3t1JdOrRU1QYnQj/OHT
         6/s3vHVdQj/2vbvF8KbLvrUuVX2XPW/3P/BAtclZ9gd7B6gDCaibrFbC+NHMt+/neD20
         sLbZjtOXIRRRB/9AzAO0UqKhqFrtHOE90SVZ72pOMX2HBQFqcmz/4Jg7Z7I1uJ7cocLz
         p9J8dCojFG2+PnO3JFcNv++6dRpuBap6gkw8Tc2aV+sMiWExusBRDxttbwm88Zfwb0Z7
         Gs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761395053; x=1761999853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIsQKEoKbxbEkb+kg7sVbRygyGKcmH9a6HQvRcu2oQE=;
        b=eN1yikZHs90WO6tg5qkqh37Y9mfzzGCh02U0zqmgHLOw4mWFngkWmXU/68Ke7pRvVk
         bs1iInnQDy7i0GwO78xAnUa4OGWsuAVAUJA9scCW3eBGlgKVXXC5xJz/2FxkJf3s+8Ha
         Bcb2CV6cg6JAb+Uy5a5AeetH08rOt2r0Imq99lz30OeUDGLssWtS8dc/YC4GBJr/7kK3
         PoPIiFEwVC816bbPDlwSIB6SmneyI06MIRpOqkdiFspFEAZTq/8N/dJpLTkelPkhNjL6
         zSWgeptWtSsXZ1EZE55BSRBa90Pcc+m4l8f24PQNGVB+ZcrP656wbXWDw0pAbWSnf0+a
         5Ayg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9UwqYFa3cjwkGLyBmRGwJwgaA2ICchUVf1Q+/DPY4jy6s0ISiumqtsYICecIsnDnDlyxxjYRgY+5b5fc7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx415NoUysJ8pKUzAkhwRHqaU4Z+3E9xuXTaaZzsikS+DuQcD8U
	egRYNCwZ6lcbdsIJnP7RgGt1EEbyRziJ1HaC14hohxGUvvZ98GciC1ysydXZTkHKs8U=
X-Gm-Gg: ASbGncvTelKCVI8AaZZMZREpUNv2Cmg9EC2RAEKVtN7A4UToUaqYyGpSwf3oK71pve+
	Bro83MnPnYPCQ6pD6GpUAOy/BNwPLHOfTBiQNtAzKcbcxT/Z0/lb58HGxuCAYfrYMXhOxvrsaPa
	7rFrL0uzTKLaAWvqj1C4gtT1BkccC6YNZ67FSp01PWXFhW09lF2wXCWvUEwzGSwGOhfVBP3xCuj
	mUuNNGl1ETvZVbJSHksEEddp2TjMwC/dHuWsQVvU9hKSMYGzByfuRfw4qSjooVJSXb5fyHM/7qg
	iuPHPhUvzD7Hr+284/Zmx3eOerBlbOpLXSJqXjkf9sTL+1gpcz97VXIsVRuLA3VXEOszqQjI1CK
	zICLQGEKiAFEPEUSNpgEJefzkeXGZZGks/koHjwR2KRgrUKYHMnRSeUnqoatbdBajNDsw8KlHvb
	STtok356skWSn2rX8=
X-Google-Smtp-Source: AGHT+IGnX6aj4QplEbOKduC9Hm0/YqElExzhN8ylWo36D6yh7PlzsYWGk22j+Sqf+KNt5U99BqlldA==
X-Received: by 2002:a17:907:db15:b0:b49:a5e4:754a with SMTP id a640c23a62f3a-b6d51c2ecb4mr964152366b.43.1761395052603;
        Sat, 25 Oct 2025 05:24:12 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853f97f7sm189813466b.51.2025.10.25.05.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:24:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: pwm: Drop wrapping of PWM polarity and state
Date: Sat, 25 Oct 2025 14:23:56 +0200
Message-ID: <20251025122359.361372-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=MaumaobUbQQd4lPrGDKs71WR0+BDt21J7MK/9q2ksaQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBo/MFfzsAw8q3FAGgozDa2VlLicakAFqPq0lVbs h04irDJYSOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaPzBXwAKCRCPgPtYfRL+ Tmg5CACg/RS57WtutcNK8+tVeLYrKZonQQjlmEz9VfBjYGo8ORCtlqzP74qfPUrvedbiGkdLdw1 k/qvsiybXk6sIPe4bDspWw2oJkNdiBkcZINqdIVeE5pGaLVNC4S/adzJX4Dreg6BVZBqHqyTDpw 5kKTUp0H9NrT78QKBH7d+lDmQomXofbQmI3u5MAOtrbuAQcSb7yOAucpyUOaXZKTD7WCJbuS8mq tu+Mr16H/e2kFptiv6GEawaiHTTSY2k1XCr0tXrvXKOTmuRpiRTH90iB2ru7VKSMi14dwdCjs27 xwJ5v+LNhh33X1c3pxuPVZYs8R/VkbVzLXU9pSHG3rui+z+F
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These were introduced and used in an earlier revision of the patch that
became commit fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520
SoC"). The variant that was actually applied sticks to the modern
waveform abstraction only (and other drivers are supposed to do that,
too), so they can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this bases on my branch
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next
where I just applied Michal Wilczynski's series adding pwm Rust support[1].

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/9f38bb32-9160-4acd-83d7-902d3e1cad72@samsung.com/T/#t
 rust/kernel/pwm.rs | 56 +---------------------------------------------
 1 file changed, 1 insertion(+), 55 deletions(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 79fbb13cd47f..c8f9f5b61bfa 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -15,38 +15,7 @@
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
-use core::{convert::TryFrom, marker::PhantomData, ptr::NonNull};
+use core::{marker::PhantomData, ptr::NonNull};
-
-/// PWM polarity. Mirrors [`enum pwm_polarity`](srctree/include/linux/pwm.h).
-#[derive(Copy, Clone, Debug, PartialEq, Eq)]
-pub enum Polarity {
-    /// Normal polarity (duty cycle defines the high period of the signal).
-    Normal,
-
-    /// Inversed polarity (duty cycle defines the low period of the signal).
-    Inversed,
-}
-
-impl TryFrom<bindings::pwm_polarity> for Polarity {
-    type Error = Error;
-
-    fn try_from(polarity: bindings::pwm_polarity) -> Result<Self, Error> {
-        match polarity {
-            bindings::pwm_polarity_PWM_POLARITY_NORMAL => Ok(Polarity::Normal),
-            bindings::pwm_polarity_PWM_POLARITY_INVERSED => Ok(Polarity::Inversed),
-            _ => Err(EINVAL),
-        }
-    }
-}
-
-impl From<Polarity> for bindings::pwm_polarity {
-    fn from(polarity: Polarity) -> Self {
-        match polarity {
-            Polarity::Normal => bindings::pwm_polarity_PWM_POLARITY_NORMAL,
-            Polarity::Inversed => bindings::pwm_polarity_PWM_POLARITY_INVERSED,
-        }
-    }
-}
 
 /// Represents a PWM waveform configuration.
 /// Mirrors struct [`struct pwm_waveform`](srctree/include/linux/pwm.h).
@@ -89,22 +58,6 @@ fn from(wf: Waveform) -> Self {
     }
 }
 
-/// Wrapper for PWM state [`struct pwm_state`](srctree/include/linux/pwm.h).
-#[repr(transparent)]
-pub struct State(bindings::pwm_state);
-
-impl State {
-    /// Creates a `State` wrapper by taking ownership of a C `pwm_state` value.
-    pub(crate) fn from_c(c_state: bindings::pwm_state) -> Self {
-        State(c_state)
-    }
-
-    /// Returns `true` if the PWM signal is enabled.
-    pub fn enabled(&self) -> bool {
-        self.0.enabled
-    }
-}
-
 /// Describes the outcome of a `round_waveform` operation.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub enum RoundingOutcome {
@@ -164,13 +117,6 @@ pub fn label(&self) -> Option<&CStr> {
         Some(unsafe { CStr::from_char_ptr(label_ptr) })
     }
 
-    /// Gets a copy of the current state of this PWM device.
-    pub fn state(&self) -> State {
-        // SAFETY: `self.as_raw()` gives a valid pointer. `(*self.as_raw()).state`
-        // is a valid `pwm_state` struct. `State::from_c` copies this data.
-        State::from_c(unsafe { (*self.as_raw()).state })
-    }
-
     /// Sets the PWM waveform configuration and enables the PWM signal.
     pub fn set_waveform(&self, wf: &Waveform, exact: bool) -> Result {
         let c_wf = bindings::pwm_waveform::from(*wf);

base-commit: 04a698c800c25149f9aa379250e78f737adeb3f1
-- 
2.47.3

