Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FDF33AD9A
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509162; cv=none; b=aV86RCJIwQT6RtN9hZ5QPrUl3PNrZ+qwiHFeeeXqfGwOKU4bcjxYn6/cJ4ahvMCouoZZGATlrOOLdMQt1eC4Ku4I0/xBTa8IM9bOtVjIy2Ll21GJARet/BRYfFJ9NekJcXfIY0lvOnTD0MnXEEd+hTVe76B23UwXZyxRipdG21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509162; c=relaxed/simple;
	bh=mWee6xZrNfTmTG2KRqcPJ0MteR3hR2HE+2W5ZnHhDC8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O+QuKeQtiD0qHSZDyaTBWgGrmh60NZkOOluo1hMpFggQGYSNfR13V0QLsFAFOIyb2c9mg4+Wbb28MIrxtGl/BUTLTeRDgFO9uoknrmmwKX3dmIGrSYMr+ONBCQWNu/nCjQ3qG0kHXbLYiBwQiQo8BrzgvNQ75nkQUypg+3DjZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4iS6DbEy; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4iS6DbEy"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48069a43217so8885125e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771509160; x=1772113960; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9/dw7/PhVES54kaBIEy1CnzvyX9MJDcWWxJs4k9jghM=;
        b=4iS6DbEyRXTYi5lfzyRRXGf2kPfzEihmNXDXkZQG5hOcCD+L3SI/VMLADqWAulQglw
         rDvRZZGiQidPqF3Ig9Kbso+NO4h7E3QS2D/02J+yTLokRBsEtNKYqUCBrUpgK2/ujBX4
         TKi0nO1UYp+hCC6Fv+bpMeIhTxqjzMvU1xedSbPtwfDGCY4nUM//lenQvBT2bNxMJlTg
         2IJ8ScvUEceQoIjd1P4RIUmMps0yg3EBsJjCvbkgd7GFyHq3iiW7tg7zg2nJKcjBQJy+
         qH3ec/WTZgrclLLn4mcCJdHdfGN5J0PdCl88uKmx/d5ZRIX2NqHL1Chd0BuxhbKOs6Vx
         uCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509160; x=1772113960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/dw7/PhVES54kaBIEy1CnzvyX9MJDcWWxJs4k9jghM=;
        b=QtecuHpTbnVzdaQvF7p1c5LMe406xs8+YIh4Fo40I5gYwk0J2ARO5MXl1vRHjn6ngq
         0PiDUYpCjILa4YWfKXwCoeRrYHuvdREkxWIvSWWPa/8ZIl/zQSIThjsrsZbnwaWM0kFe
         KlmKDKmosv/RJKVmK6C2zuFXgSLS5GSSq+VUwyZnbOSoDPcOFGh5dkkYJgPmLjxO3U5s
         SJX4mnO9YZsFk6Fe6Wcc9NpGbNTjGuRQIXcgCOxoHJ4KpA6qcBH/+1JePVCJ78J+NM04
         phOV3PqAAoQFBHtMeqbUXlyTQUbNh5aYmtm9bt3FolnBLoVgXuS2VMXp+9FDRKQ+Eox7
         7YfA==
X-Gm-Message-State: AOJu0YwNNcTTVKi/Q5wwb4eQ7OiHlrXfTfQ2q+vyfJalRk9i0yAOiy9P
	OdQbupMsnqaCYIrT29WBgougPLuGUZ8dv+q5qQK634Lvsw2Sc/McOyS5LCtCA2WICjQGZfEem/h
	BinADAmsyy9sJnH5qug==
X-Received: from wmdp17.prod.google.com ([2002:a05:600c:5d1:b0:483:291c:7f23])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548e:b0:480:6dff:e786 with SMTP id 5b1f17b1804b1-48379bff816mr295884705e9.37.1771509159855;
 Thu, 19 Feb 2026 05:52:39 -0800 (PST)
Date: Thu, 19 Feb 2026 13:52:35 +0000
In-Reply-To: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=mWee6xZrNfTmTG2KRqcPJ0MteR3hR2HE+2W5ZnHhDC8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBplxWjLZnhuH1LUcU6+gseK6xv/kT5aqHcma7R8
 J5Kyudt5K2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZcVowAKCRAEWL7uWMY5
 RiVSD/sHrBtkt90WXfWzafS0bwjeOdEY8LOF29cEgZ2p/2F+Vmg54NPY1UW5p68t8vSU7Geh/V7
 wbPEgObFCQndSeqOKValgBrWP1bwLDlGi2TK6aVC2uYpLmW500iSs++AshkllV2BWMdL7/oc2Hx
 ldhLl7LHZaqcOpimJv5pO53y9STMfQg2Jc5Gjd79CrMq+CTY2XJKeVG6pYFkv9gbEysDbYfHKcJ
 GrEQOnQFoqsHbrndDpGS5Qhpnx81zgL5cAetm43m+DRRfi8FP909j1/viwrBO08kbYDgxQ314H9
 QYMFakXCTmDcb9X2XFwMoWMaLjbePb3Vhc17SUR+juCG8gmTCxaA1b+lqze8hthN4lnL1tF6oLg
 ovF50wJse03fssYePt0vP9Jtvq58sHRVb6aySocZRtRA+eBiSKMZXsignZ0Ba8u9HMDwwhfszA/
 DKYe1uypskkohonxHeFBhPAoDCCCj9qJmeKx1+ZdoxK7gQGJX5mA2SuPKstNJuJA56i5Zfcgxwk
 cZuOdlcgW7C1Ee79xJoWpX2Ar9o3+tUE1tKzprwM+qnfXqD0dJW2LTFWqwQLL3bR84v0vO6EIms
 7EICXVHzUw1rjVnpUAoe6jqRmqvITyEZvBrN4gP7ELKy7ZUA2cGsi9oTYJ6ciosLXzu5sG01NDX cz4DNsmgtbhX1/g==
X-Mailer: b4 0.14.2
Message-ID: <20260219-close-fd-check-current-v1-2-fcab8d8469f5@google.com>
Subject: [PATCH 2/3] rust: task: implement == operator for Task
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

It's useful to compare if two tasks are the same task or not. Rust
Binder wants this to check if a certain task is equal to the group
leader of current.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/task.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index cc907fb531bceea6e8dc1175d9350bd24780a3d5..8834bf25cce5e7b7f48cd649c977eb92fbfb61e9 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -362,6 +362,14 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+impl PartialEq for Task {
+    fn eq(&self, other: &Self) -> bool {
+        ptr::eq(self.as_ptr(), other.as_ptr())
+    }
+}
+
+impl Eq for Task {}
+
 impl Kuid {
     /// Get the current euid.
     #[inline]

-- 
2.53.0.335.g19a08e0c02-goog

