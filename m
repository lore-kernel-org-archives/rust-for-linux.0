Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A54C83
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728714643; cv=none; b=nvSbpXIbcnfNW0ap4CeEx+gHcVct1WhdpnPPssO3/fOdo+WNMFI7OQQUMK9ymNJXdLqfh0ADJOqbrJ/hO1+10AFQ4FPbBu83E8BzBNC6DU11XOFTS1A6WB2JUMitVsZARERYjOwWrBOqu6vzdJx1uvMX43g2Z9PBthA7TcYD9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728714643; c=relaxed/simple;
	bh=wkro2RQIo52AY29OFgewTgtqda3hvn/Q+j3WPpGTZDE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=QVfS/Xh7lgSny+rS5GNPPV4NQXeyemrmy4pq2HY/KMOF8GwuB1f65mKBQRiSGG1J4c1vbk5zmDXh02BGdsgh8j62AuevpzLHMKKfQWFpwJiKU3fBONFRmz0Ye9Zzoz2MD2jz87mLXE0jokEnJUUsV+fVjzqorR8W3VYvnqid/sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lieu+ZQW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lieu+ZQW"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso417236866b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Oct 2024 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728714639; x=1729319439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbI7q0JMaliNWF4y+x/lHtBY8InKFG77KeoELw7g81I=;
        b=lieu+ZQWI82FkRVpYwurUNXfabFDOA9yLlPwougS/iGmf9+ieJyNAYNo7BOhqfE5s+
         i94GaPXuxsIEe1m0ZTdB2LMfEzeqDgf8VHFdfWqK2qdWenrXL+ebOKW6Go8HPRe1X2Km
         McyayKqtmp8hIgLOwGQlPRDwJN0p66dj46qbyJ0tBrsm8pIOzPNRhmRlYLk++ngrZieU
         4gTIdGR+Hy8/CSYFyDunSII9OYXcJMf+CwJi8AzUFpx34NAz5BZ6TK8TEH0jp59ILUlA
         +hpfQeeT+PwDPdoGEqR9PxujPZTqttc89btSXCO8evEwMxAgw3ri5hb3acOMIwPTUeDH
         A2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728714639; x=1729319439;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbI7q0JMaliNWF4y+x/lHtBY8InKFG77KeoELw7g81I=;
        b=aRLYvgiqUQfIk/RjQkF8qL0E43sSXOoUx0t996UNZMiQAgksgPualAXJYHqhCvrPf8
         KhTzzpvZdQVMmrD3aYSKVz/7YYMCUcPI8pYySVNtbHxtXW1ixXQV1+vjC+ezWUNwxjtn
         YpU3eUyoZ8cyZDrzcT1TKRttRzvgj0P1SplJsySbcQrhzlGtQfYh8Vwbyi1TeM8+k+ge
         VT+ep6+YRM6Qy3saqLK5s7NyzrlFkJB+9Tbay8DaGTTcAce38dq/hZWnqv6Pjz2KZJR/
         HOIggX/7uH/9J8XRnAWrEcRF75WIRp83Ow4Q5zmKhScW7sNP4hlJ2ONx2Slzz2b7t3nM
         ie1g==
X-Gm-Message-State: AOJu0YwBhErlUgpBtt6lJKZyBoi3zkIj+/7w+FfIT9sXaOIOEAWPUGDv
	ozi8HgKdj7V44TROrx4nWab57hkZRnMfCtJZyPG9ZnS6jyUldL1b2/akpeE4
X-Google-Smtp-Source: AGHT+IFuf4x/DbkdOEQjk4fy2vkMqnF+PDkz6kPRQRtIZevGV9JbBb/wdnuoiobXVpCuPr6I/z2yrg==
X-Received: by 2002:a17:907:1b1f:b0:a99:e1a1:473f with SMTP id a640c23a62f3a-a99e3ea59ddmr158528866b.57.1728714639076;
        Fri, 11 Oct 2024 23:30:39 -0700 (PDT)
Received: from ?IPV6:2003:df:bf0d:b400:7350:36ae:6e0c:c598? (p200300dfbf0db400735036ae6e0cc598.dip0.t-ipconnect.de. [2003:df:bf0d:b400:7350:36ae:6e0c:c598])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0610sm285995066b.123.2024.10.11.23.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 23:30:38 -0700 (PDT)
Message-ID: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
Date: Sat, 12 Oct 2024 08:30:38 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH] rust: workqueue: Enable execution of doctests
To: rust-for-linux@vger.kernel.org
Content-Language: de-AT-frami
Cc: Alice Ryhl <aliceryhl@google.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Having the Rust doctests enabled these workqueue tests are built but not
executed as the final callers of the print_*() functions are missing.
Add them.

The result is

     # rust_doctest_kernel_workqueue_rs_0.location: 
rust/kernel/workqueue.rs:35
rust_doctests_kernel: The value is: 42
     ok 94 rust_doctest_kernel_workqueue_rs_0
     # rust_doctest_kernel_workqueue_rs_3.location: 
rust/kernel/workqueue.rs:78
rust_doctests_kernel: The value is: 24
rust_doctests_kernel: The second value is: 42
     ok 97 rust_doctest_kernel_workqueue_rs_3

Without this change the "The value ..." outputs are not there meaning 
that this
test code is not run.

Cc: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---
  rust/kernel/workqueue.rs | 5 +++++
  1 file changed, 5 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 10d2bc62e2cf..ba0f397f8b8b 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -69,6 +69,8 @@
  //! fn print_later(val: Arc<MyStruct>) {
  //!     let _ = workqueue::system().enqueue(val);
  //! }
+//!
+//! # let _ = print_later(MyStruct::new(42).unwrap());
  //! ```
  //!
  //! The following example shows how multiple `work_struct` fields 
can be used:
@@ -126,6 +128,9 @@
  //! fn print_2_later(val: Arc<MyStruct>) {
  //!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
  //! }
+//!
+//! # let _ = print_1_later(MyStruct::new(24, 25).unwrap());
+//! # let _ = print_2_later(MyStruct::new(41, 42).unwrap());
  //! ```
  //!
  //! C header: 
[`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
-- 
2.34.1
