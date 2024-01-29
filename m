Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C44604AA
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706530937; cv=none; b=A5PnP/TdiI7R6l+nVXrSOPWM060OEPcKIRvE9iVzWgNGxUpWRK+qFfShU5gkDNgoXnQEwm3t5wJyNHhRRjF8lFXMPjptefC/85OX5omGqCo8inQCPVOJbF4Bc4A+x8Tb8J5MOYdZJhmejLxskYp5sruLWHr6jjPBTPI6OUNoDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706530937; c=relaxed/simple;
	bh=7ncRDgtObW0Ks7PjrVnRjuF5KnP3PaDLgYdD1ioGKdY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZFSlyV88t8D8WM6gHIyxJ58uQKnCz/2kLeSC7wxQBDyMvKbRipTq3F3TOxGDtIzBtnFX/7JwjqIwB6NJ7hTeBUXSi9K9hrZyFj8jA65eKawCWHWB2TtT+QPIydTF3gyJMexFJklgC1oRd6DF2GW2aughr0CDdc4jVSNbWOkVt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSFVvcnC; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSFVvcnC"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc22ae44595so2861110276.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 04:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706530935; x=1707135735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YSPchUT39qPR0ZB5NZ3t/M/6y5E1BqmbAYyjCWa8SZw=;
        b=jSFVvcnC1cwISlHQ0RImgMbmn98rYrebyC70va3p772p8dO/CLqHX1D/LZKfMILcMd
         s+gZBjfLWCKPwZL/Y3ZnY62quOIs7FL2BglEYPz0Mu1Pg5VRcleYht/QkvM50fwQKSOX
         VG3HJfz80jhCTS3DWMRlAInFURT5HtbFlv5jYw+GyJXLAVFQfv6XwFBv/ViHrLTcvdco
         Z4MiUyHZsdL9odPUj48mzXl6pRbUFGlqTho3LSa8w+5HXlkxwS08HoZEjAQeRreDuSuV
         UnaxtlyLHIBP+xsbNeXSS9+JPYQBfh6GIP7TL1cXf0MTPEGqa7VZwFkBSseKVcn8TTcC
         Wteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706530935; x=1707135735;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSPchUT39qPR0ZB5NZ3t/M/6y5E1BqmbAYyjCWa8SZw=;
        b=al0vjKcIAt7tTSNLzUR8P1Cv8R8PsBVe+B18B5lv008WILKhdEtwOpJvnSjzDYdKiZ
         rdlxky0tGdZD9JxSPSzEM18yXkicx5qE0CsgazqGNJzXy5wPPhV6okqHiVpft8s1tp+m
         RZXdGe+ZygbFh5luVB+BmsHmLXJkigivBtVIQ8uaBfzMld9LR/xPOGVbAq7Acviqr1bN
         1N6Bt7JMa0Z+wyVhK32cDMPSLo/I5qAl7sSOsSDLKsrWyd2/F4px9Vdk3891Nfph98Ef
         Sz9/0AXpwfsGIHLOMbPHctrcFuG5AKqlAZt3VwWZ4PxTzmu6YtrgmyjKBoLJ9xdsAlkc
         NMlA==
X-Gm-Message-State: AOJu0Ywvj4Xc9M1SKS1YcBbwjrY326+mXHVPGkZXfNF3iql2xS0a1Zfa
	S6McuHJIBeJG0VtpvH4kvRC54tZYMl6jv7cnxvJTRWT5V7X0XaQ9cbjj133Av4E1ZDIxdKorRkF
	IUn7R/B6zqf59KivwqT6TMTNEvtM=
X-Google-Smtp-Source: AGHT+IHizdDvPn8vYCLjJBYBP/kPASHHXWfxtWjXirJn9gR+a3nLXBC/bhgyW8o0RDIJQqIdReJCzba5EecoSj+8xjE=
X-Received: by 2002:a05:6902:2806:b0:dc2:37c5:72fb with SMTP id
 ed6-20020a056902280600b00dc237c572fbmr2562213ybb.74.1706530935239; Mon, 29
 Jan 2024 04:22:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jan 2024 13:22:04 +0100
Message-ID: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>
Subject: linux-next: workqueue + rust build fix
To: Tejun Heo <tj@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun, Alice,

Today's next-20240129 includes commit e563d0a7cdc1 ("workqueue: Break
up enum definitions and give names to the types") which gives a name
to the `enum` where `WORK_CPU_UNBOUND` was defined, so `bindgen`
changes its output from e.g.

    pub type _bindgen_ty_10 = core::ffi::c_uint;
    pub const WORK_CPU_UNBOUND: _bindgen_ty_10 = 64;

to:

    pub type wq_misc_consts = core::ffi::c_uint;
    pub const wq_misc_consts_WORK_CPU_UNBOUND: wq_misc_consts = 64;

Thus we need a small change in Rust's side [1] (which in turn triggers
a slight reformat of the code due to the line length change).

Tejun: please feel free to fixup-it into your existing commit (diff
likely mangled, sorry -- let me know if you prefer a formal patch
instead).

Thanks!

Cheers,
Miguel

[1]

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 498397877376..d00231e18007 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -199,7 +199,11 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) ->
W::EnqueueOutput
         // stay valid until we call the function pointer in the
`work_struct`, so the access is ok.
         unsafe {
             w.__enqueue(move |work_ptr| {
-                bindings::queue_work_on(bindings::WORK_CPU_UNBOUND as
_, queue_ptr, work_ptr)
+                bindings::queue_work_on(
+                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as _,
+                    queue_ptr,
+                    work_ptr,
+                )
             })
         }
     }
