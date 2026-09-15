Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3144A3F1
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501030; cv=none; b=qMpqSQz3Co7TJjw/1Ww2o+OfU0kI5W0UsRVTOffS9Q0ktJXKkeEonbpiu0xbd55pK53GH+7YSaUx8VBewTZ8PbUhojd0HiLU7Pml0iM3OnkIP2hUqJqbolZKXaADWuGtHnKU29s62bPJSkbqINHTFTq/hVYc2WNRQBIS3MMS+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501030; c=relaxed/simple;
	bh=iQpFxkadxuZthWNzpNDmq94Hthwi+6Tsc7gHXxzEn3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nD3Ig0G5IlfxZVec0Huf5CJAn4Fr31Rp+lttlVXgaHp1vUaqZ69a1md01C5N/d2U9EIdfPHQMI/RNxWFmiuzdIzJZpYkVt3i1PZv+GIbYmnEv3CcLWpp5ZGnxaG2VPmDvT1JT1dW0Q3mtsNcPdPMKniSGc9wM/vvayVfDOheusU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEnjNWOj; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEnjNWOj"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79229116537so47486137.0
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501026; x=1790105826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=QEnjNWOj6178noHTDnNBoB2Ol/RwIhbNowHaIau87hbSioWk0PULq+aicSI1czJmjI
         n6B8DdUd6UXI4tnHq1+9rBjpGiGlILED009hK36JEfJj1xDd/gLOXCX5cW/ze1nFEqPZ
         O5XlyxRh/s0JuJL/iIz0Zup7S5yabHeEIf7a//bnfTd2XdriH0zxFrpc7NVf1ekK7qxR
         EFJNO6psC2eZxBVReJ1me4WW+d9BiqAgxhoyOOQcVgYHzZv8aiCokAq1dtaqeXeNIr+x
         Hh0IMmvGye0864punvMZa8VaeebU+s5ccgn78opWl1lR9Z6dhiKDtCxMOhRlJDbYk9zP
         OA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501026; x=1790105826;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv2qyWJdbrcJvcqAwpcW93SKoGJg7N/Guzup2THPVL4=;
        b=KXtWX3yVut7TGelAvuJrwFN/awSIj/sKkxmHA5nRelBCDys6i/hqdBlXvk4Df5t3Uq
         q6FJB5JJh9H1WNtdlZgL+DJ2GieIQuZ7/6v3KU1iaahzOFzSTI4CwodmMDDTDQQxW6RR
         LnvZXWR2SswloYqvc+KRAmNQpPGdsAjY6rAtgXZf5a007QHBBo8jtA2LOCd5ON5MeZjF
         CMIEyvasCAwVWsUDvxw/EVQv6H3eLGNINFaTzJnhyrsWCvcEc++np5V806/rSMcmbxIP
         GIrWGtfk2t0yJznhd7JQqzZt/Ce3bgNE0r5Y51ikw15v5rzZFtkXouQtuF3ByBzQS8ze
         5OYA==
X-Forwarded-Encrypted: i=1; AKwUvByBVuY/PMZt7ky4DGgGgTSGfx/U2J50RCbMzLiroLxN7R1+vyAivA+oGJaPBRUhW8CKgkW97ZhILzLlPKYo/w==@vger.kernel.org
X-Gm-Message-State: AFuF++kMWykSNcng8pyJEgm16NJO0P5XBEksVb5Fk7gn/fv4EtdzhZx+
	JtEmJTMq3BV6J7CHppiJhsHnPNvGcsJGaM/MlPHmyBXSduV3qcyc97s=
X-Gm-Gg: AYBFou1c8HlEQ0oblvYsqt4DvI4nO5rrpA6GbDDNB0zKwm6YqmJGBbFLUnD5NaWgDvr
	rjhYV6AGnRyuvwfi0mQtb0bH3nCvixcsg5ZuNio2BwhCrvo7r3WmfginN1VsqbaWItk6rjdvUwj
	TMitUCV3GjmIlunAcpmiTqzcL8+2mElgIiFBCpf/7K7a2Jzmq2b175h3mmv+ag+JARIjmVfYEFC
	/749jErbAtLC7jiYIr3cT0K8O9mb0NP4D6RzZHOBhfGyZgrgU3vx2Op8RpTOaRgXwPu18T6iqd5
	FsLA0f5CoxSsKohcLhiQorQ7CxNpIvO7jADcGM2G/eu6CmKOAcvR4KqgWw9dFEPjIHwk5ySB8IU
	BjGMtAV4K6AY5ZNITEtdJ3JkNolgIPOWZzFsBirpeHKSsncykB4uSBG0UjLZTk5XGK5ASCYZZCc
	bhfJC+mqjxmVIl59xPiyxGm/JmuQ6kH+7ympMyD/sGox2ntOE0L9NhMSbwAlMkO3HvsP4c/edd7
	9mUYpAEAjAk4iRuyit9BPDYdGua7TOe+HVfWc0vhlzCrs7JLg==
X-Received: by 2002:a05:6102:5607:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-79b5bf316f7mr12420909137.8.1789501025587;
        Tue, 15 Sep 2026 12:37:05 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm691450137.4.2026.09.15.12.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:37:05 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RFC 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic case
Date: Tue, 15 Sep 2026 16:33:54 -0300
Message-ID: <1a319df6587bfdcfa497fc964a9a6d21a8988e54.1789500084.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789500084.git.nico.antinori.7@gmail.com>
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..a9935b2be8c5 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -571,33 +571,29 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }

+    #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
     #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-        // TODO: Kunit #[test]s do not support `cfg` yet,
-        // so we add it here in the body.
-        #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
-        {
-            let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-            b.set_bit(2048);
-            b.set_bit_atomic(2048);
-            b.clear_bit(2048);
-            b.clear_bit_atomic(2048);
-            assert_eq!(None, b.next_bit(2048));
-            assert_eq!(None, b.next_zero_bit(2048));
-            assert_eq!(None, b.last_bit());
-        }
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+        b.set_bit(2048);
+        b.set_bit_atomic(2048);
+        b.clear_bit(2048);
+        b.clear_bit_atomic(2048);
+        assert_eq!(None, b.next_bit(2048));
+        assert_eq!(None, b.next_zero_bit(2048));
+        assert_eq!(None, b.last_bit());
         Ok(())
     }

-    // TODO: uncomment once kunit supports [should_panic] and `cfg`.
-    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
-    // #[test]
-    // #[should_panic]
-    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-    //
-    //     b.set_bit(2048);
-    // }
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
+    #[test]
+    #[should_panic]
+    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+        b.set_bit(2048);
+        Ok(())
+    }

     #[test]
     fn bitmap_copy_and_extend() -> Result<(), AllocError> {
--
2.47.3

