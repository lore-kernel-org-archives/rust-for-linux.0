Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686834;
	b=GkQJMuN5FfQop2qqqBGScDZVNFDy1fevhrD77+MAYYs90kgQaeexFoGQaNXdPPAeIUlw
	 FXMYLcLZfbty9S249er86kRywy0QTk7LBR7GAagtyxpygky5ptYqLtUjAt0wk81CLQPB5
	 t0fCL2/tEMC22n1LeV1PF1M3EFbWYJ8YUUhOUaRbFFfAkfcgOn0zBkQsDxTbzp60QQN5y
	 2174tkgRfl5rRNQLTGbs6zzHdnF3s9/+WCHBGBqhpRuTAxLRwqWLfw/PMpYd5NjvQAj7R
	 QidwQsXt4S7fnvBYfqfmeJw21V0QffmyNmbZXOI3zaCw6W32lzJW0U/r4Fx32u8qkMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CuzfEbpK6SMX5s62D8VhwwFSgZwewNQ++RDy8jpJRaA=;
	b=4lzsoK7NRMhnwW0EboMXzSX/EvAqqgkmWLYrQacZWHWMK2/1eEKBcOO8UnF0Ui/batmr
	 pFH176JxNbW67CyTwd2IDd7GjX6SeY4rXieY67v7vkYc3nHZgk65SiJElPC64JDuw4XF+
	 ESXlON1mrliXdoX7/eQU9wH4Ili1/Ub+WFuSgVIo6ivRLgaAQ37w7Qvio7SMranIARbRv
	 WIVvOgRQzrNNqSV43j/PgmcNCzpuXRLTaQh2mYgjdgnR+yLJhLWZIRCqFAf2jABF73ny2
	 cg54tObn4LOareGXqPrfqTyVHNrLH0vXN5rDZu+6X/fWFuY5TyHybpyPyT2+4VMss4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFIRwbj3;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AD606A333
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 09:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429AD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFIRwbj3
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso36790285e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 01:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795686833; x=1796291633; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuzfEbpK6SMX5s62D8VhwwFSgZwewNQ++RDy8jpJRaA=;
        b=mFIRwbj3mXaR9Vjjmnly7m578PJZkNRattVk0JGhh2ojgFYN+qBS6zgthCnwAgLes4
         mIZ2oH0GJSW42rsO9HkeCHMG5CZ8pTpEQMUtvua/terxVVJtMVC0DNegVaGhSZDi9kTn
         lmfvFAOSpiQ7vyTnZfZ8pdbZnbGTtLBjBYiJWq0TOpmpR5ESWJbIRNltI3Fb9aipCp0h
         zf8n7p/8zAC22O7JM4w7/vHISmnY6012f5JEDd7Za1KrTRA95jNi7JslbceLLWioXuSu
         RHZDspcU4+gL6IWyJFmwcs3FMK9/za2WfUqKwwIUFRlxaYPf3uPr4OBTN+bTj/yImBzq
         r/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686833; x=1796291633;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuzfEbpK6SMX5s62D8VhwwFSgZwewNQ++RDy8jpJRaA=;
        b=ZSchTKrdd+g2wNsvL/5yr0D9NbxxHDg5cYEl083pJa9jgFpCTYQf2L7fuPJ1HrhHs2
         rrAkmtAht6PNPcC4FX62QYOwn26n0TXKIUByKmsbtCD8qPWR59ElaREIGEbA5rXIF/oJ
         llFscjJsEdJNRntvd/mtQB8qCnSsbrH5e26yHofO021eQA2uclMPzE+2oSpPiVtaw2bZ
         gkZIB48RhCWOHZ1uwm4nqwTxfwzW3z5y4TWsLXLSPG3f51v38vnrVNG5SSwGcI8c8LMQ
         9+e3MxvQswf0z/Dh2GkN+zw9niWIvoQXrieUEPh1ZXt2Yl55Tx6oxJLpnuUtq650FT3w
         8gUQ==
X-Forwarded-Encrypted: i=1; AL+hErFS8/O4v7j0gJLdIMaWsuV2C2URuayXTec2xyYmF+dujFORDlKPy0tdu4d6tLwDZHCPDMBW7VjbXsLM0WQ3ZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+KE/7Hfz2gUx9rcD4eIdl+cq+uHBvho9hf1rxg2ruNkcAquY7v
	K1voOVsbT4kXDmtrMRI05IDLsOJvTtIIx/cDX8ZcI4tnVrBAwmMjlWFSVRaM5oaB2h8GCfPuerw
	WSdD/XIJDhQ465KRCrw==
X-Received: from wmbef18.prod.google.com ([2002:a05:600c:6612:b0:4a1:dfb3:2e66])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr414847705e9.24.1795686832411;
 Thu, 26 Nov 2026 01:53:52 -0800 (PST)
Date: Thu, 26 Nov 2026 09:53:42 +0000
In-Reply-To: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=D/f9oxKyC+0/56/KEOw74+zJmNkPLDR+DYLqojHESgU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrCAGq33LkyEM1Kp5UxVgcoJPi82CGjjlbyW1go
 ahuN4hggKaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawgBqgAKCRAEWL7uWMY5
 RqvFD/wKbJV5Opv9yGzOIOj7YSge6Ul/q4nRnBl6PIP7+HRm2NsUEirOWCZL3JAV+GPTJnyiYwL
 FySoprLoLWePqkB9lFeKVuPU2A9rjKHDvykgHh72qBIylWucgWEkcRhSP4Eri5mfXid7dtKcGrA
 G11kUg1gESq6dcdkkaYvcqXYk0AqJ0InRLtS0JafmecqbkQYX8cWEcmfBzFjqCYXTMSZMiNAuro
 wr9ccf7rphqEybBFlbEh21d+JgBge701bdCF8VFuUNopTKyhspwH5NP++Vh3xOG6BmtWemzNNTy
 uL4NaPrpSxpVR9r87JOI9wrmQXvnu7jWUS93A6k/jO+MNT6tlMbt+JUAIdqdd/AWq3eVTNgbDFq
 a5XfQoS3YH1smj7Pu4kGddaQoS2dPT5Xmv63agMAQrTkHhgbsy2+nKIt0S8C9ydcStE67h+xx55
 YODeLu9nvziegqHRnevTIZXCNAhSnMbO3sPrGIgKv7EshXx+juCkyAQD/cA42EcQmGHNBNjBF0o
 D+IuYq2mfST0xOQSV9NNbJIBAeTkKTyEdRf/G9llcSESkd6Z3w4mG7Upm+lKxddW3pPaKAcAzWB
 aRwiDoZjAPfnjH+uyieMjdeehb5A9GbDWMn3fxuZHUA81TA0DiR7q4OPH3H2gCbRS/U7hK/KLZj wrw1Rgw46hSErTA==
X-Mailer: b4 0.14.3
Message-ID: <20261126-binder-32bit-fixes-v1-3-22fc21baf6f8@google.com>
Subject: [PATCH 3/5] rust_binder: reject transaction sizes exceeding usize::MAX
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On 32-bit kernels, casting `data_size`, `offsets_size`, and
`buffers_size` from u64 to usize when reading transaction metadata
silently truncates values exceeding `usize::MAX` instead of failing as
on 64-bit kernels. Note that C Binder also silently truncated these
u64 sizes to size_t on 32-bit kernels.

Thus, saturate values exceeding `usize::MAX` to `usize::MAX`, which
`copy_transaction_data()` rejects with `EINVAL`.

Cc: stable@vger.kernel.org
Fixes: 5326a18e3e64 ("rust_binder: introduce TransactionInfo")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 8357313875d5..23367dfbf393 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1310,10 +1310,12 @@ fn read_transaction_info(
         info.code = td.transaction_data.code;
         info.flags = TransactionFlags::from_bits(td.transaction_data.flags);
         info.data_ptr = UserPtr::from_addr(trd_data_ptr.buffer as usize);
-        info.data_size = td.transaction_data.data_size as usize;
+        // Saturate sizes exceeding `usize::MAX` to `usize::MAX`, which is
+        // guaranteed to be rejected as `EINVAL` in `copy_transaction_data`.
+        info.data_size = usize::try_from(td.transaction_data.data_size).unwrap_or(usize::MAX);
         info.offsets_ptr = UserPtr::from_addr(trd_data_ptr.offsets as usize);
-        info.offsets_size = td.transaction_data.offsets_size as usize;
-        info.buffers_size = td.buffers_size as usize;
+        info.offsets_size = usize::try_from(td.transaction_data.offsets_size).unwrap_or(usize::MAX);
+        info.buffers_size = usize::try_from(td.buffers_size).unwrap_or(usize::MAX);
         // SAFETY: Above `read` call initializes all bytes, so this union read is ok.
         info.target_handle = unsafe { td.transaction_data.target.handle };
 

-- 
2.56.1.839.g22a8290db9-goog

