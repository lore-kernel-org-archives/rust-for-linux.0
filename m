Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CC279DCA
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299393; cv=none; b=N1ikSfxmt+PuMrLJmfurDbv+t4Uzaomdb5tAAywmm3UUh1FNe6HgFHcREJlULS8McFG5Luliuax5QduqigNCbFX07ybNSxsD5izxYkm+f+oqhABc1JvB9KlAnEZi+k3hx0cWhw+hNPFAV8hNA51/BgkuFeCghBreuvaBWQOez94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299393; c=relaxed/simple;
	bh=D1TIb1AYdqawMmuhhOtEb3rEPPoyNZYPUhKNMa7xQ5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=se7Z9ukaQ7zxlgGl839RNl1uvfmCfEbpwtdv8oFwHKS+koNIt6c9Zz0RDlMZqLZdtgy5h6hv4I2gJv6qYCRLraMRsLY4TMSEFCa+6OH/Z3cunZXxqpfK2wvAzhMWzs9XuKG9chDUAKDAlc6+VGKH0sA1jyqw5AOJJ11EI8albTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2tFK+Oq; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2tFK+Oq"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6965638a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777299392; x=1777904192; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SloVXux6ndYMbOukk6el+VVoouriWlEz40pFhKl+fIU=;
        b=l2tFK+Oq0TGWb9a7w5Zcy44IM8HiBhx89Uzafdda7af++uS4obJJll2hXqzJAIB9oa
         OhXPRoUaturLua9tcst5sV6cCgBdaTbAZPwrOVkTDIRPGKtN3uJ2z1uotWlchDWvSb5L
         Wmp4vHHETcKqJG9XUZx8r+d/Q805EiPvWVhnFkj0PYAvYpH+sfW92+LrpbcmgC8iXxJd
         9L1TPK9lKb1rH3ZzvzAd7bVFGHVJWpFH0iGwGafYm8DtQjVueMcVkmzKliIGiuOgVHg0
         XMBzh9yRDgDrc9pVwnsFu+fotbN7LwUe+SXI5OA9LOQzp7/Rb4Fs862CEO06hU9oRwc6
         s5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299392; x=1777904192;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SloVXux6ndYMbOukk6el+VVoouriWlEz40pFhKl+fIU=;
        b=n4SyN9scdBNdW+8W0aJ3gQ/GO2NaMFl8z7irgpnm38EM51POY4J1RgLGSVR0l4ouM+
         3NmSuZszhOiBuQc2KKybKUIMyh47VtB1uGsisu6Acknr6oe8LJ44WMwIZkVQlZZpTzUi
         aBx1hqzhK+B1rsKC8hh1ajMj67eQsACIIZVA3jnG3ULsS2wUjFXWCd8KZ+Dj1X2H3bq6
         eYtQg/t5MTU26XOSNNewEudbQlQCTPle57zsYea98PbcdH5gyNo8R8J/div/UYSq8uix
         fB6cUBPhGIpWoIUJfPgh1K6vNPr128bfN/WX0m+2dxKspJhIdeEDJ1haDsl0XJiBAFKM
         cbFg==
X-Forwarded-Encrypted: i=1; AFNElJ8EXjqgigN7ex+HsU5ltdHXiWhVVXJcs4jopmjJhHKISXXhYRa1yMYpdr7+OpAyFVzjjKeOelhwbiEel+Z7sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJnqsKOSuk83+GHUIE1kTmhNG6SxjFPplzF1234c5MpsoNLcd
	+LOOdu2vkd6infJIvNqU4hS94fU+vYd/ZwB/trdTaLqNmBfdgGROmldQiMovrVVu
X-Gm-Gg: AeBDievcwdr2iUccYxI5FEB6/ucMLD5kq1SnFr0Yhd7Y/3MTI0pXydZCkIf42jtX0/y
	qEcdNshIaVs/1oTAgA3bMwt4L4drZQA12ut7zE0tCxXC3ZBZ8t5VG2wEB5L5Qf41KFwXS8p7Rvi
	rIp0B8lInYG+W7cF673X+PKmO6bd56lS4FAVFGNTgou5LDZfWMxnDjRwaDVyKbz38Si1dvQb3U6
	4VwN8GNSY5Cor3zeEfv63ilJS34Qak2oAyRcL7qwmcBsThP0kRVqoW8rpjq/Cqqepv8VpS78w9j
	cn8Drtgu7UA1fXbjRUTVs3jY6lmKlUTLTCG2JW2wfHyanZolPoLtTmnoZt4AIxt+pEOC6Pi/8jA
	KmSVDspLDmuqozdEw8Vhz65fl16Mr9EnYnKbOR6P75uaJYWFmXSP1L1UeJfacoolVjtEdR/aRTS
	J/etl+nNcUWsVv4on6yUzo1CzGaBDHRP3msK3peGhZS/UfZFY=
X-Received: by 2002:a17:90b:53c3:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-361404745f7mr44763276a91.15.1777299391680;
        Mon, 27 Apr 2026 07:16:31 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb95b1csm15253337a91.5.2026.04.27.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:16:31 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Date: Mon, 27 Apr 2026 22:15:49 +0800
Subject: [PATCH] rust: alloc: fix assert in `Vec::reserve` doc test
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-doctest-kvec-reserve-v1-1-0623abcd9c2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJRv72kC/yXMywqDMBBG4VeRWXcgxkvFVyldaPzbTgsqmTQI4
 rsbdfktzllJ4QVKbbaSRxSVaUzIbxm5Tze+wTIkkzW2NqW98zC5AA38i3DskfIIrrumRFPY3lS
 glM4eL1nO7eN5Wf/9Fy4cL9q2Hd9U6vx4AAAA
X-Change-ID: 20260427-doctest-kvec-reserve-6a84e832b05e
To: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hsiu Che Yu <yu.whisper.personal@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>
X-Mailer: b4 0.15.2

The assert in the doctest used `>= 10`, which only checks that the
capacity can hold `additional` elements, ignoring the existing length
of `v`. The correct check should ensure there is room for `additional`
*extra* elements on top of what is already in the vector.

Fix the assert to use `>= v.len() + 10` so the example accurately
reflects the actual semantics of the function.

Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72nkXWhjK9iFRrhGtkMZGsvNE_zVsu4JnxaFRfxWL7RRdg@mail.gmail.com/
Fixes: 2aac4cd7dae3d ("rust: alloc: implement kernel `Vec` type")
Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..d05f3835cf53 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -611,7 +611,7 @@ pub fn clear(&mut self) {
     ///
     /// v.reserve(10, GFP_KERNEL)?;
     /// let cap = v.capacity();
-    /// assert!(cap >= 10);
+    /// assert!(cap >= v.len() + 10);
     ///
     /// v.reserve(10, GFP_KERNEL)?;
     /// let new_cap = v.capacity();

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260427-doctest-kvec-reserve-6a84e832b05e

Best regards,
--  
Hsiu Che Yu <yu.whisper.personal@gmail.com>

