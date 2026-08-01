Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E592EEE77
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Aug 2026 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551123; cv=none; b=m4HYk4Jl3AcS0rSV6WCH9NVXGEOMMQoU/cHzLz6yCwL5V02MukqACUS+dqfgq53r3LY+Ub7He56h+Wu05zFBDuwjGW7QG20/N3C1eaGooQaP+bN+kh6xlyCO6UpSIjjEwmUtb47UZfGE7OFb8i/3Ad6lQ7rRb3c7JtLFh7nsBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551123; c=relaxed/simple;
	bh=dhsqqvmI58Zm/hN27PZXdr1eGkLDS48c+ixQpLFwDf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpzG6c5cxNxkv8lTUKrKuoQ5whjAsXShF+JEDXwG1sWkP9C9nK1yC9Vwvb2gfX9K5IwDILCoZctXUGdLC+Bjop5sx1Ocnd4kqTnmu4PZ887Qmin1r43clAC8Ru4Eo+YXF0J/w3ceFkDWGh85QbIQJ0CNNQIG7R6Iht1zaooTt+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=WbWcBIaV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M5d+pvAC; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="WbWcBIaV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M5d+pvAC"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id A1A0713000FB;
	Fri, 31 Jul 2026 22:25:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 22:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1785551119; x=1785554719; bh=2NkahgXZy6YDg1lPmebO5
	GP6GO2GHrUW6hHkjH7vCl4=; b=WbWcBIaVUqNumIAMbyD/lb9w7tepm/swKiEuv
	haGd60AtRfw0zsktjoub6OxuivcVg/49ZVFrHRnnEXkAjuzl1SQoeelyxZNSnoW3
	6coo0dCYNGxXczh4iRJEkJKlZ1P9aRibKIqDyycbTncQeuhbLPYLT3ORbmXkD5aT
	UxM9v7aGhgshvFZKF8ZOgBeuSQeokBsx51sr/xjNyOiHD3BaOSa1v/IKOJ2myYzk
	LhD9J4DbrQiIjFXW6MEGKDPUnJA/PvrMBCSLHJ4DFZ84esrJtdKzCxc9iQRvseKl
	vzvJRsi5qLpbNZcDc0amwB6k3IwNpn7OIDQnh3vtpgvCQooYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785551119; x=1785554719; bh=2NkahgXZy6YDg1lPmebO5GP6GO2GHrUW6hH
	kjH7vCl4=; b=M5d+pvAC+vSztueDF0HPaAcxAkCDZXM40xWoT8TPF0j6kwWpOja
	gMuJ4rulnI5clpFPyAwT5DIy/6+blQl+91iaNu4uj0FD8+55IJvh36mycW8/nAmY
	9eJ1UytGjAM5mCXRodFWN5wU4h2P3F459RizY3gk2Fze3lh7jw36HUhcbsi1+oj9
	bnHJtrDbrIrE9kodYKnNarPw79Hf09FOYYfUm6ON7moysYXfq3g+enNwReFn3Wc9
	AagaomjoMJeQzJvNBStpBYMXntAuZq3OaoDi9Eu5jq2hhlYMOJ+S/HEhRQXW8qjp
	xl2U7AfLGIRcjOpx4lKz6AkZsY6EkYHIX3A==
X-ME-Sender: <xms:Dlltam6w00lsomeB3oZOly55xZ4soLWNMk7CRnck7LW7oERsvGz4vQ>
    <xme:DlltahSKJwv81NtWn2Huf8K1XVRADpzpVRzAENmu726YEHeEUGfp_75pzWwwsvQef
    xCGB_cA6kzVmBUQFYY0BynkRQOkNWyK9jqptyc5UdRbIBTuSq8hu6DS>
X-ME-Received: <xmr:DlltauuBCoTvlc4tWRLhKEEBgZv0S4Et9IQtz9TsUoZLnwLqSuBno7FvQeR35-ugTf5mFJycZU_abhbI_KQ>
X-ME-Proxy-Cause: dmFkZTFL5J+P3pBhS0sKQbc/ZRVTPm4LUnoO0xtwI75u0TJ+UrrGHSt1EOQOXsM5/8z5v8
    RmiJ3Ze86Cmxr84EVGJU+ip7PJMLS7+/aDPAuYvkjYYrjMdSZpydaKSYBGMjie0qOf2T5V
    7lU5SCzo14e+4dAovEVadn9kZcZeDwJHDbZNnCLBT0wynVzw/5vlsHsCUj4W6Y/4l7qJj2
    q/o6I56dHl0HkTSbLaz5sqN896VMumBGPzvYtBY4N7E0rQrH70J7eY6svBvfo+T0ELbmMn
    7UHE4dH5RU3HrrgITESCwZT9ncgOf+A5DiIvolGM8vlB6wZm5TP/ZyxAG5+is1iWbaFHUw
    f+Lwxtsz25XMCmL4X7rzUh+kE/LCUXXUecbEfS0jBLjQVqcxfF2e4+LQvqw5lJMTcNKM+9
    ZEIlFiLFzjurVFVMvAtF1mFXVKjiqKxLFy5weM2Q/pq91xixMFi5axowRHPRcyfK7aEk4d
    a1VuhQN4ieCe7tenixgSbqi0r5nKfqJbrG5snrs0Hbx/eqJXemT/jt/ZbRN2natNVZM6uG
    4lPzSBSG34K30Gdry+MmLu2uYaLJmoVLGhPt7CbM4xwhxKLOqYWbucxNTKpO+vZoyV/dCK
    8iAwQ1CgeJThd5ghXnRiSBs8gkth0/WEL5TsSEJv9RA1X0+I/N3YAUF+dWrA
X-ME-Proxy: <xmx:DlltarYpzTsSBbcCSuqzrs5gCvJu5phpVhupDjGBW7gOmzd11BcItw>
    <xmx:Dlltag9QQif9fch7Bz7czA9sjYSOI05470kQ5QLCl3Bdf78hsq8krQ>
    <xmx:Dlltavrt4C-ERPoo-jMNB2aawzBooRnUBKtvb5hYe0LsR5aBRCMzlg>
    <xmx:DlltarFB-1j9yL74dR-VPbOlgpcthvqXWwdAOXiAux-sEZXhStrzzg>
    <xmx:D1ltalXlFq1a-AQwYXfQ1CpY5iGWkAcYeSLHA0g72jEvbqJ6fFO7mkIB>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 22:25:14 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-um@lists.infradead.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: bug: fix warn_on macro build error on UML
Date: Sat,  1 Aug 2026 11:25:01 +0900
Message-ID: <20260801022501.722493-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Callers that go through `kernel::prelude` have `CStrExt` in scope, but
code inside the `kernel` crate imports explicitly and may not. Using
`warn_on!` from such a module fails to build on UML, which is the only
configuration where `warn_flags!` needs a C string pointer rather than an
inline asm bug entry:

error[E0599]: no method named `as_char_ptr` found for reference `&ffi::CStr` in the current scope
   --> linux/rust/kernel/bug.rs:83:49
    |
 83 |                 $crate::c_str!(::core::file!()).as_char_ptr(),
    |                                                 ^^^^^^^^^^^
    |
   ::: linux/rust/kernel/time.rs:427:9
    |
427 |         warn_on!(self.nanos < 0);
    |         ------------------------ in this macro invocation
    |
    = help: items from traits can only be used if the trait is in scope
    = note: this error originates in the macro `$crate::warn_flags` which comes from the expansion of the macro `warn_on` (in Nightly builds, run with -Z mac)
help: trait `CStrExt` which provides `as_char_ptr` is implemented but not in scope; perhaps you want to import it
   --> linux/rust/kernel/time.rs:27:1
    |
 27 + use crate::str::CStrExt;

Use the free function `as_char_ptr_in_const_context()` instead, as other exported macros already do.

Fixes: dff64b072708 ("rust: Add warn_on macro")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..ca1ab69c977b 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -80,7 +80,7 @@ macro_rules! warn_flags {
         // with a valid null-terminated string.
         unsafe {
             $crate::bindings::warn_slowpath_fmt(
-                $crate::c_str!(::core::file!()).as_char_ptr(),
+                $crate::str::as_char_ptr_in_const_context($crate::c_str!(::core::file!())),
                 line!() as $crate::ffi::c_int,
                 $flags as $crate::ffi::c_uint,
                 ::core::ptr::null(),

base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
-- 
2.43.0

