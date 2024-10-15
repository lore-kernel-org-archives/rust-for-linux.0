Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222013212A
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729002528; cv=none; b=bjFIhNt7UFV17WyToxsa7Zmn68uJPRPhG2aygjL+8tvlf92svdMACWqGYun58lwmj+P+mkR7IiZFFoVAXUrJMft+8GeENZKzKn0A/fVwDKLwZYUnilt1TT9V5R/iFY/9QI5bKV5su7gTXdoPP5wU5aO/K+ru/ZZUay7ujieZAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729002528; c=relaxed/simple;
	bh=t8U1gyWwNSEhj9d9K6BaPBQ0ctfmm7LA5efgRVulxro=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Bgkv1lQE8wQclMeIdYbTmB0UmRgBAqM90lhMP3ZZjpwHITRfbUW/ffm1NL/EiLDsBR9XgamalhD+vQQuVe1LDIdwdrYYCx9Coje1ReVpNC1LQS9nUdU29va1rSIV+8rS46uT33AmwKdYm2i+/FjiyhhzZ84Wumza5Cb9fzeY044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NKVI9wtt; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NKVI9wtt"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e2e5e376fcso103002357b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729002526; x=1729607326; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XNJeKzAtPjp45SIJ3/kfvuUMRNzvKyffpnVSTmM2Fh0=;
        b=NKVI9wttr8zX3D/62rJd77UBVNheJgdQXXvVvp4ikoA041oG7ioO8iSuWjWQY6VFRq
         1aHCB//0VF9EK6ouCZjeF2FgQbJ8far4qD7kJoKTW4Ln0NHz0Yx8wtQlLX894Ty5ldA2
         NVsZfe4x1U/L/l3XadSKKzlTBNdelb944aeNTbumj0OoXKIFIs9qBvvcCYQ+q8teuPve
         mLNtxRjfdPP2S3uiyL9Yt/sP21Z3ygWTdXkc8rEMKj8jWD9JVr2KwBiwKUES5HiXw27c
         ORLOfsZhKicxIwO7jJWiBri6kpB0mVUZH7Mlsb9ccAveEPb1hbcsVLsc6nN0fJBTUJf5
         9AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729002526; x=1729607326;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNJeKzAtPjp45SIJ3/kfvuUMRNzvKyffpnVSTmM2Fh0=;
        b=qb7zv0xZvF3lMck3Irx7Wjj8adwAH9ThRhLhYdv3GqEKV3HkQNZiFhF9GCbx4tb35p
         xKJFGmxLEmNUzPnQjxKxacNHPsDchzB809JFGczx48tbUJhNcikKa2B4pNTVB5WhN5HQ
         Hse8vDlfVMz8G4Q36ZiLaYavYeJqD4QQ40K3ARcsUBnh4UUxfuNwQuedI542F14eZU1g
         lhJE9tbJnjymfig7HARasZIW29jovOCsHKLLWro31MeLzj3muTkr+8yOZ5KF+O94BA5N
         58+GRiGhC2Z9Z/ggm3XUvq+7iqjg/XeBF7fDoPccUJz0ELNeY/V/GCNr39JH5IBsR56J
         3qFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN6LPiUqFKPS/JUqrJ/Niq4/u0vJZK+KJhsoePAG3RNxhYnj0Ho6M4MxU480zRfqk1dTKnoS/e4Gjla75U5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/JEk6TjXf9qGrFxVfF7LeuEDDnRP4e3ReUH+82KiuN5bXt/Y
	Xj7acH+na053b25ig1ykkUFskRJyD5/RcxRm6A5Q09w1Ti+Ku9BMStDPF6cH/17YHUs4D8ObtfM
	Pt3wF8iK0WdoANA==
X-Google-Smtp-Source: AGHT+IEJsZCQdJgQDK83UiVeL8PodNSP1mZnK7L/+YXxdoFRVd72bLcQ3Ll9Bb0b3OGyiUHdTm+vltTMRxpnJ8A=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:2d08:b0:e28:f6b3:3666 with SMTP
 id 3f1490d57ef6-e2978567367mr346276.7.1729002526293; Tue, 15 Oct 2024
 07:28:46 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:28:28 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAt8DmcC/x2MQQqAIBAAvxJ7TlBRhL4SHcxWWwgThQjEv7d0n
 IGZDg0rYYNl6lDxoUZ3ZlDzBOH0OaGggxm01EZJZUXx7PxFKQuHNnoTnFU7AgelYqT3n63bGB8 omyDhXAAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=t8U1gyWwNSEhj9d9K6BaPBQ0ctfmm7LA5efgRVulxro=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnDnwMVnOv25ulL3mEcQA0kNsek3R1xTz5taYha
 5Y1rpWY31+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZw58DAAKCRAEWL7uWMY5
 RlXgD/4939MppK4B/TGTf4FZZfeJydTXzv8UMnCIqv8aPgKYfnApFk+PbRKDUXzGxTGrpdw5fKG
 zxA2rh3tCYAMTXueMSZdEFoE8lagpvilyS5Z/cvPQZB3xmh3yTvIjCTlbPG6LPZzHptiGW1RqJC
 vo54L4y3uiCl4HYLNKGUB3lkzHJHAytQeILBRRWgPtQpZFgQyiNa/cGE3EHPbTqTAOqZXDwo+aF
 GRql97MJ/xS5HOV4V1miU/Hv0jFDdRphecPH4nDwQ0Ja/d6roUDfpp9MSJwr9MjGfaACh8Nzu8e
 Rnr4rPSCpdZwokcA7ZbI/NjI/9JMuYg3kqVvt9pTt/g8a1X3HX++F1i9XYfUgkpxcuH6zseKWNc
 sXl+RmfNUDWsyr48LDF/MKbhlYDtBunbJkcXsUBobeCy66UvP1Ae+zqe+9a6xUypdz8f+bz8ujh
 FaxQB6i+VwUpCE8BtJ+Q41aI9N3+1PCjA98PmY1EG3MkX2IK+SCpgFFBIWIICa25NIg49cKfDRE
 TfqYM/LRME+ON8Hxebo1R5stTn/eT4226Qi09e2sEr7N0ov+ZidylEj+XlfmvlLNsbUizpo+D2T
 qC+TkH6et19oK1qsE2ynkRNeiBojAAiHeSNgr8I0Yw7PyautHKZP0hxLafIwKcIyjP5QeB+k3KK mzG1gXcw+kOfGug==
X-Mailer: b4 0.13.0
Message-ID: <20241015-page-align-v1-1-68fbd8b6d10c@google.com>
Subject: [PATCH] rust: page: add Rust version of PAGE_ALIGN
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is a useful for helper for working with indices into buffers that
consist of several pages. I forgot to include it when I added PAGE_SIZE
and PAGE_MASK for the same purpose in commit fc6e66f4696b ("rust: add
abstraction for `struct page`").

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/page.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 208a006d587c..90846e3fe829 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -20,6 +20,11 @@
 /// A bitmask that gives the page containing a given address.
 pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);
 
+/// Round up the given number to a multiple of `PAGE_SIZE`.
+pub fn page_align(addr: usize) -> usize {
+    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
+}
+
 /// A pointer to a page that owns the page allocation.
 ///
 /// # Invariants

---
base-commit: 8d8f785ceb21b9a0de11e05b811cc52d6fa79318
change-id: 20241015-page-align-7e5fa4c751be

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

