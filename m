Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C031FCC67
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085713; cv=none; b=fxQq0kklvbQkI0oZjIvvEIR+OVvDZwGXv71QfC/uRsoMdGeVRH7qxezrOf7soeRkdqg/EUo41G4MSJgUSukQY9fRZlVCT83qj2IXwhsc754ZI64rDC1ocRVCeeZyiUgeP/47Ysz47pyjpiJkH8iyVDMkeccvvnXfXAv3XfYbtxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085713; c=relaxed/simple;
	bh=QBERmKorMxqVCLC0uXuv+/O/Y7O9Tm88a0mjpgnqG2c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Iw5z5H+b8ZHAW5CHP6pR6J6DqiDp49VmYjujhbgNyiLtqWscvJOA9sIeG0MBq8uWQNkAPQeT0kNUenC9vyyvHDkF1rAkESAntFnhhSj7j/fRG0HI79Y/Jw+qJ3IIStrkAP35tDj5Ok7C0RV44hrGgavhiAzuLeqsDLWUWsJ+tSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VamGJE6U; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VamGJE6U"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso1658155a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729085710; x=1729690510; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIC5ym5lyRpoh3lakhNtawnYUqSX+C+qFI2g7fX8K0U=;
        b=VamGJE6Utp+TYiI3fcMWX3T+VUS/ofF8cmXFNtfPg2Qs5mH9zFbN4L7rpq5XFT1wc0
         dwHXD9EraEOEWc3oHawBjpC/GRJUu4Y2Os0aD2HMIJ9jwMLy72sgiczejvyv8EV89hs6
         RNzpPNgtScXn4npSjjTpzLTGy/zcMyfk3Kkwj/++FR/1PvasHUdJs1iUsmtqGaunynNw
         2kbY1WgImkkyPm+r/840irycP7KV+ex5zekoMq3GbKvgi8TPj+cNE4+EHJ24XaRZ3W6o
         oro3NRavJqQXpKSO6EIAgHYwO12N4hebQosZcf0kP1M6dpRTJrvARjiEQUePY9a4UPN0
         77Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085710; x=1729690510;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AIC5ym5lyRpoh3lakhNtawnYUqSX+C+qFI2g7fX8K0U=;
        b=Yg5FT8zQN5KVBq1c4Z0kgGUG1wdOVBY924RINb7w1YJ/6ZjzErIrTDS4X1TVvf6Bgl
         wXgcIPGMvjdmQnUHjObThxK/rYTdqJ3O9PBfBBigIRyvxA1XvK4IWef6Jpnes721oZO4
         Wb5tyZj2HDtA3ACA9rq65A0ffKXDY55fMgQoGjU4dcZpAKUT/O9C10yEt/7fMIbvyO+G
         StbF6DzGV7uDhfJVC594SGyzP++OftYnYdUrAy/daucKtdAYIag9zIYN8DNeZnmh3Acg
         7Eim1EhauwnCDP25qUAaCv5+rIyORe7N4seEuwOaXe3GZoIq7a8UJvhnCQ2Xgde+Vga0
         8fqg==
X-Gm-Message-State: AOJu0YweS1Zgw2dkDNuHrS/J5gqamShkALeD6XaMIJfaPzqXlSWYX0qZ
	DWTS6cWi0+0FvtoHLsyjyah1p5PzTJQC/5CMg9kVKJRdn0KCWd8Ll5R/r2AO
X-Google-Smtp-Source: AGHT+IEC9sPunBlaqWyECvTe8EPROe6AsyU0amjOORjCcOcsmb/av1mQY6db/+5HEVU/WvZrh36OhA==
X-Received: by 2002:a17:906:f5a4:b0:a9a:861:63f4 with SMTP id a640c23a62f3a-a9a335dbc83mr399946466b.17.1729085710083;
        Wed, 16 Oct 2024 06:35:10 -0700 (PDT)
Received: from ?IPV6:2003:df:bf0d:b400:4611:f27a:f592:9ec5? (p200300dfbf0db4004611f27af5929ec5.dip0.t-ipconnect.de. [2003:df:bf0d:b400:4611:f27a:f592:9ec5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971b0bfsm187898866b.10.2024.10.16.06.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:35:08 -0700 (PDT)
Message-ID: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
Date: Wed, 16 Oct 2024 15:35:07 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-AT-frami, en-US
To: rust-for-linux@vger.kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Tejun Heo <tj@kernel.org>
From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH v2] rust: workqueue: Enable execution of doctests
Content-Type: text/plain; charset=UTF-8
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
that this test code is not run.

Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: Tejun Heo <tj@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
---

Changes in v2:
  - Drop 'let _ ='
  - Drop empty line
  - Add additional maintainers into Cc
  - Drop newline in commit message
  - Add Reviewed-by from v1

 rust/kernel/workqueue.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 10d2bc62e2cf..3755c8e5e9ea 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -69,6 +69,7 @@
 //! fn print_later(val: Arc<MyStruct>) {
 //!     let _ = workqueue::system().enqueue(val);
 //! }
+//! # print_later(MyStruct::new(42).unwrap());
 //! ```
 //!
 //! The following example shows how multiple `work_struct` fields can
be used:
@@ -126,6 +127,8 @@
 //! fn print_2_later(val: Arc<MyStruct>) {
 //!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
 //! }
+//! # print_1_later(MyStruct::new(24, 25).unwrap());
+//! # print_2_later(MyStruct::new(41, 42).unwrap());
 //! ```
 //!
 //! C header:
[`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
-- 
2.34.1
