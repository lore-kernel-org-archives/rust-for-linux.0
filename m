Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B12253FC
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478817; cv=none; b=eyasSBeEEKdUj2mYWHPP/Z/Wk9c9kkhCJXLn7jMUwlM1NFQMStDkBw/4HBFRoiGtJQFBKWCyQ3kVzs+PmTCqZx7xRZHVPKMFMJKL+Y3V7hEt1s9C8m/GbNN3M/iyIgiQiJv+7UGO3zQTFWGgb+YVZvsA99x3VBOmGM5lvX6MCfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478817; c=relaxed/simple;
	bh=NCAdAD7zcQQG3DmPxpb4nW9umd28Sgb4e1h7Xd2XolE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=utiG03c+kLfl9reDlhSX79AukuxRAZMXUqL+Coqz6/J51e6hP8phuHLYUFIKEAsntTcGmXzeblscnL9CzReaeTYeFVh5CwEx1dr2QOKJ82ehvux5/xpFX0d9S/DCPyzvFHL2n24BHFlvfzG2WoKkfqmdK9jJjuntlINYaU9xz2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=on1QeZwF; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="on1QeZwF"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39142ce2151so362334f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742478814; x=1743083614; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARoR/4rbfxmbwkx8MsUi2O1VKkXGVBlgDqberViU+Ls=;
        b=on1QeZwF4l5IKECzJ7cTm9j25hxrgfckeqj3a1y4+SFE+h4bV5g7JvTRI7IpWa9rl9
         V1VWmwxxBHDR5DsKnUfQFMi6B2DUjt1UTBVRdRD8PqIp079CQRYo5UG88DHTFKr/0Pgw
         p7aEvCKFdOzUi4VgQpPyMFaUQh6aN7iAUR5KqVJTvgM0RUWDTQp/lduKRMWzVPCC2XvW
         Dm7sqgWwALRVLCWvLnZaGVRL8E15sQQpr4i9PV2mGicl+EFSUYc0yhYzZDGrl4Nl1WuK
         EmLHsT0zJzu5CAP7SyDSo0RETqmTICGBOvcMxtXC2MlTvhbm0FtsmAQ7ndbX9NJKPb7H
         1KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478814; x=1743083614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARoR/4rbfxmbwkx8MsUi2O1VKkXGVBlgDqberViU+Ls=;
        b=q4tBm4mAzC8mpJ0Zhg6xSugmKUd5NPlcY/Rl+Y99ozunM+HK0icaY1Cn+/DOeFFYBH
         TaKWjQ5u0uHrGE+9WyKSaaCy4Xcg2Z8rvX9Kc9qq710U+jTOHmWkO0WQAgDl6l++5Ehh
         t+dTVQTr5eDEv5jAxbMSTbQFhHJYXWYnNCyY/tKzOZVsuot4/JytdeRTEqdlSJpPlDnd
         LI++ohuo0c5dmJdXx5RCMNrXaH3QlRAwRoWk3Vn4QQh2mtH10YR2fX2K2LqM4l0qdxls
         6qIzJpitWmnUEE30YwkNh4/1cfOA10q+kVK0lJNv+iDjwxOhllmlv+gkjeEeQ2uP8v0s
         jCSw==
X-Gm-Message-State: AOJu0YxQefIMAS+zjjmSB1JywvRKyxOH/HwYnme900R3CSyFnjjoolMA
	q91y1akGgG85YmcxNHYFNngOHaggRdp5KQrvyj1/P9YAg8OA3N7yDV6e/hD7qfTEekbosl8xb04
	9w/HQ/zyXV1HQew==
X-Google-Smtp-Source: AGHT+IGk1VdvocsBb4oxWBkhM8eKGeq/5oOXyCMhkbRPxkFUqPnga50GXXG8kVbBNsuNobfY3vnahdRVjW03aOE=
X-Received: from wrbfu22.prod.google.com ([2002:a05:6000:25f6:b0:394:d453:93f4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64ee:0:b0:392:c64:9aef with SMTP id ffacd0b85a97d-399739c1f58mr7094721f8f.20.1742478814714;
 Thu, 20 Mar 2025 06:53:34 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:53:00 +0000
In-Reply-To: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2846; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=NCAdAD7zcQQG3DmPxpb4nW9umd28Sgb4e1h7Xd2XolE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3B3OAP6GNwr3WDtZT5V/xWKWknls04prEXKq0
 YkqvMbPSgWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ9wdzgAKCRAEWL7uWMY5
 RqaFEAC4C1slxPMFONjtELvLg3Z2lonhLkvPeEiY+ubrSjRI6bJMkQvEekJ74MNGhyEwiLPklmm
 hAbZAOVsSPed/Bus+tlXu47Tb+c8xTYS23KAmdJb+uCAOywmTxAHM+a9HKQQp/jWujTzXi+AUvo
 V1s8oGFSnoCRn0WyttpV9ah/dIGyPKJ1EMlASd8f7aiAItmjdCjDbXzXEgYeDTSAwcMMwCK7eVq
 IwXDwaUuZoK39a/EuyQvtQIb92h+6/9byvlaUXkBxRb9n7RjYsu2ZNRIOltlIUrcks+tOKTJvxm
 V/r5ZOO+kJMYTmro6rOHexRvsV1grH4+ppq8O5pAE2PSIKGJjEBrDmQULKyHYnHku0UjLSD5JFo
 xu8BZ7Gjw0ycHDA2ZsdWD/DCqOFrDe3lyeDsQnDvNs9iMzuimTF97RLi/gW/EBVBvfjHpslBBs7
 mjny3n3xeUz8u2S74a8bPTKd2cx29U4sjDS2s4mQWlyJtGDuuckB5svz9xwqe5zj/C6Oa/SqZX1
 KVAAJRrbsQBA9FudWPBK2t/aINplQkyVoO/aS94Y5EKGa+e2+cK1DQHpy5e+y67PvYLIgNDfUqD
 kANC31eOX1v5/6rsAT7/5eLsDh1iRlgk49x6imrLPH2SNXO1v1CS1iegVcxTjNW2YMRlhDdlHYF 3rDRib1JkmiBWlA==
X-Mailer: b4 0.14.2
Message-ID: <20250320-vec-methods-v1-5-7dff5cf25fe8@google.com>
Subject: [PATCH 5/5] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a common Vec method called `retain` that removes all elements
that don't match a certain condition. Rust Binder uses it to find all
processes that match a given pid.

The stdlib retain method takes &T rather than &mut T and has a separate
retain_mut for the &mut T case. However, this is considered an API
mistake that can't be fixed now due to backwards compatibility. There's
no reason for us to repeat that mistake.

To verify the correctness of this implementation, you may run the
following program in userspace:

    fn retain<T>(vec: &mut Vec<T>, f: impl Fn(&T) -> bool) {
        let mut num_kept = 0;
        let mut next_to_check = 0;
        while let Some(to_check) = vec.get_mut(next_to_check) {
            if f(to_check) {
                vec.swap(num_kept, next_to_check);
                num_kept += 1;
            }
            next_to_check += 1;
        }
        vec.truncate(num_kept);
    }

    fn verify(c: &[bool]) {
        let mut vec1: Vec<usize> = (0..c.len()).collect();
        let mut vec2: Vec<usize> = (0..c.len()).collect();

        vec1.retain(|i| c[*i]);
        retain(&mut vec2, |i| c[*i]);

        assert_eq!(vec1, vec2);
    }

    // Used to loop through all 2^n bit vectors.
    fn add(value: &mut [bool]) -> bool {
        let mut carry = true;
        for v in value {
            let new_v = carry != *v;
            carry = carry && *v;
            *v = new_v;
        }
        carry
    }

    fn main() {
        for len in 0..10 {
            let mut retain = vec![false; len];
            while !add(&mut retain) {
                verify(&retain);
            }
        }
        println!("ok!");
    }

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 303198509885f5e24b74da5a92382b518de3e1c0..00dabea8ea6c8a742a7fc95954d8de58be124493 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -588,6 +588,20 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
             elements: self.spare_capacity_mut()[..len].iter_mut(),
         }
     }
+
+    /// Removes all elements that don't match the provided closure.
+    pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
+        let mut num_kept = 0;
+        let mut next_to_check = 0;
+        while let Some(to_check) = self.get_mut(next_to_check) {
+            if f(to_check) {
+                self.swap(num_kept, next_to_check);
+                num_kept += 1;
+            }
+            next_to_check += 1;
+        }
+        self.truncate(num_kept);
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {

-- 
2.49.0.rc1.451.g8f38331e32-goog

