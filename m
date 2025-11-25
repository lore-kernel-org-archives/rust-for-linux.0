Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D932571B
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079203; cv=none; b=Jd8dfUvZAqvCCy9TaMa7QHfUd6oLda0ES10hqpXGk7BQo3KspKqfmiQOE2sbLh/LUI3wWBqo2YMaIPEe7GqUpNnIGnoTkuRTPdE6M/fURLvCObQ4yxEfhX3ccrELBQCxV0v6Hc/qhLDnJqBnWLrN3z94PAim4Oy+HJ0CiWhSTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079203; c=relaxed/simple;
	bh=zjU+xITGYBikz3POlNtXOEPXelplJfBbb1n+/juZ6VA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qc2GblBGy2FKrLyDGnIVVAQGiwzW1cCBk8BKgxhkBQ9snwaGlJTcB0pQyy8S+qgkLF7ec09q7LMu7PMWlgA05rbRlhIc88cRGSAirZrYbaFMjALK2+aIkTRe1auPt6fgUz0MvvceL9vnTUcrUX0COW3mxzXBBuTLefdEORzfZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLBUU8Vw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLBUU8Vw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477c49f273fso45997605e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079200; x=1764684000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ridHkn+8MIeXliQ1C+V4Os2CRUMRRUj3W1b/Hqz1Mc=;
        b=gLBUU8VwMg+92q+pdq5GsBgrQWVSkhU28zECfvoKNfTmqfqReb3+pxbwa5WmFkZ7rJ
         aBcsR6n2vpq9pNXPB18dxhNLNobCvprlxzkV/IPjGikxz7nX64RgGI+8TAMcAA6eE+rM
         ER/ktyivoo7FHfTcDEJ/HjKTTEJJfmcmQYufOk/avHxgVXxaWR/SYmI8kRVE025pV8Sw
         kdyK7Quhv8Koi7GqhUxQr9zRjCOpdnuQfbCRTHeWqAwKR5H+OvZp0oQdl7+bC6H2BDUY
         zErnQe1MqKRURe0sa+kdNiG7Y16r7lUeQVyyKJunCVv13f1P6NVKjlt6QrY0RwbRRYpv
         2yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079200; x=1764684000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ridHkn+8MIeXliQ1C+V4Os2CRUMRRUj3W1b/Hqz1Mc=;
        b=UepqF35S4fzRIfpKGwb/dQpBlatCFrVUxe0f2bBAIWZ1gXSDDLCO9N7ulqF6q4gWAg
         jY3tK59pJ128aXd4wERdLfWApvODmFxeURMHCnQk9sdtboqP5Ku3d6ncZU28WgKDaAnA
         1rECpZZ9tnyaqMWcmZfgd96BoUpzsIrJ0xVGfatCOb2iJm6yvUZ+DeTfy0YFH6uy9/FB
         +TiB67shz+xu7AlSxAWdTAUUy5TULvqOWKi/m0L5hjpqxaAiWWPyidFQ0PbT2eXhjFfY
         G6NkFfBIKXLOHzy2CphOqaTYLWnFrK9xIGlMQ+GC2zgHCoootiKpiqrktiVQUwxFJ66K
         n1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX5NLxZSAObd7oB39lvQ+GSc9t/F4Z4SqI8pNQHeyBgHVjJmfjpMGG2rsifc7SzMnm/GTpOk1vsRdiCxhvOJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ZI2ZkYPOwmb2aS3r7yxm16MuA+xdwX6dV98mJikH4s164t52
	A4wiqSnNnW5JkzRrBtbYJAYy5kF7gKZSx2tL+qrdcr7Og4HPvCA5pjT1irM16mB2bxjijAIWKQQ
	xtaTIQk1xc/q0jQ3FCQ==
X-Google-Smtp-Source: AGHT+IEKtSfIuitGQ3id5RQJVYt5y2EoUT2oM33EIONJTDt15OpOx968jb4WJdc4CS0+xkC1sZ3vgfrUWNrlcM4=
X-Received: from wmpg42.prod.google.com ([2002:a05:600c:4caa:b0:477:7ed9:17ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8e:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-477c017512dmr147750455e9.2.1764079199625;
 Tue, 25 Nov 2025 05:59:59 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:40 +0000
In-Reply-To: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=zjU+xITGYBikz3POlNtXOEPXelplJfBbb1n+/juZ6VA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZYqTKcsz22atZEfxzG4xjJGo0eUshxVev6E
 aMGl5K4C4SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2WAAKCRAEWL7uWMY5
 Rr+eEACWgQcRUdJQA14WuJL7sAPA3w1SOZ3sa2T6ZvPAjW8cf27sI3x7mRvrSTsi7tVQBGIAeVR
 MTidhCHXjDUGac4d3Z6PZz/N4fxCE0dLTCQrACefD9EyHxW2J0XKz0FFsWzlwO3oMAphGYYnZn6
 MCvk0mu/hCmARm41ZavvnnCOmKTawgNdRzJS78x1HaP0Kob5RW368RUwxjry6oUGvXKpCgSqwYj
 GmtPrpWSBZTjK0ofvq1h7crr2CE269QWurJ/p53beEo19olT4DFVlphwqlU2ASUV3C3Cn6SHRfy
 Y/qiV9XIF/9CPNLy2LK6cYi/WO8S4vnJxrOtKnWmSNr2YfW0bDhKuj8+R2biXCVvtsK5apVS1GC
 X8RvbfCP3EXZmeX/0WXjs3hHAcBzObYLFYGQZ1zNuNkhZaKn/YoXHBl7y2eo7gKdwSBfdmHPQSX
 t9Ru1eWn0MeafRuyhRLtlfP2TRV4B0yGfjo6B5onM5422ubUEejah8iy3UYyxyV7RIwtpNdYpOk
 +LjQUoKhHsTg/XFPQ5OMB3nsZzwexaA44AQJzt9VZC1aC2w4WYOdoHsB3bWd3FIaDc1mOCpQa97
 u78LbwS0nAzsHsX2cmc2ZDt+zP779nFS5iBJiLTw4GGNarO/SxvxYpazwSM/hNmifdoBzmH1Znl Kiwce3DT9U0RXng==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-4-dedaf1d05a98@google.com>
Subject: [PATCH v6 4/6] rust: id_pool: do not supply starting capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust Binder wants to use inline bitmaps whenever possible to avoid
allocations, so introduce a constructor for an IdPool with arbitrary
capacity that stores the bitmap inline.

The existing constructor could be renamed to with_capacity() to match
constructors for other similar types, but it is removed as there is
currently no user for it.

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
Reviewed-by: Burak Emir <bqe@google.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/id_pool.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index 7968b6c5566bf7022b865b5f59deaf46c96f747d..1adec2c6fdb0b80515f9b64c67218efa864ce580 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -93,6 +93,18 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
 }
 
 impl IdPool {
+    /// Constructs a new [`IdPool`].
+    ///
+    /// The pool will have a capacity of [`NO_ALLOC_MAX_LEN`].
+    ///
+    /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
+    #[inline]
+    pub fn new() -> Self {
+        Self {
+            map: BitmapVec::new_inline(),
+        }
+    }
+
     /// Constructs a new [`IdPool`] with space for a specific number of bits.
     ///
     /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_LEN`].
@@ -229,3 +241,10 @@ pub fn release_id(&mut self, id: usize) {
         self.map.clear_bit(id);
     }
 }
+
+impl Default for IdPool {
+    #[inline]
+    fn default() -> Self {
+        Self::new()
+    }
+}

-- 
2.52.0.460.gd25c4c69ec-goog

