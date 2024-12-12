Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369A209F5F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 13:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734009171; cv=none; b=mYTCimWf9sTpfv1AbCgKiYTBjFN9gudVXo1wRflCs2xXymJCM1GbwOa6TaHOVyv+ue0mZK9W4eQCcy42T7EnNBxkWrpbUigWRPS398KkFxS/8FbKFsi7lbHWMcwAa4XdM8+rFkMY19BusHLBCgm7Y6Zh5rb0NtdfPLjaTQf/bvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734009171; c=relaxed/simple;
	bh=pPPWX8Ivwy/gV0ty75BIy0qQGhmfgM1RmE/XDdVKt8U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oBuLNwftgKFBee9/f2ST8zfoRedX1T7boaf54bt4sdXMvbc/YRzikJXt+VK18qPZ22QVsSyTnhPgC9G2ZKDCkU0TlCf+eJPiraYQHUnra3z7WjigPUxdnwdeM9PzSndq3I0mkUciBZ6cA6aZ9kahUl4l/jTB9elfuuGgxIF7+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1bW2rhya; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1bW2rhya"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361b090d23so3757675e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 05:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734009166; x=1734613966; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NxSuGPEUP4LGoJOZXmNeFLCDtdbxnqDmxNJo3hcCyNU=;
        b=1bW2rhyaLQJcZvinBZBocgLtwNUd3DgBFVZO72qi3sDmF+0hE8pZ9yz+65hOrzIhZ5
         rRQd5GEPsjspa7ayuE4xbuntAaKocs1waTZTQqwlOMImyYgG5sMucR2xndcMYp43dMb4
         8YbISEFnucMNIdwDBVBtCSTj6tg1pVfUE5m0mYaHhdaACwmGnzCivZGkpgVTEOjlwF0w
         X1oypEfoBqokb+W7ii1TNbQQ5BvdMlVRgjDUK3ixpaYc8sfI676ltMCFLFPTQm58E8wm
         XwhOliyDpBjy0MlC/5I6vASXg8q7+0yxvjL07iXtBwTzUXW/Rg88Klk7VL92DnquEdTG
         iLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734009166; x=1734613966;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxSuGPEUP4LGoJOZXmNeFLCDtdbxnqDmxNJo3hcCyNU=;
        b=E0b5i3VIkFfc3DuesAhYUEOQZlAWnh89rN7nb3P8a+2DBCzp/iGGzlBeyBIwY+rDBw
         nhAgDcohQMxDUhdw51oYQxeMAmzam+vqxp/ymSy4u+B25HZvwZdhKRmLF//uQ2ZKZmQG
         WGWzN0wxvM6ZoXu1PHBl8W4mPcO9NHJ3CI63CDC/lw99DgA7MksxZPXHnAIqfW/cqBOg
         xVJF2sd1G06ACWaqTBHH03yvHbCLfpH15REH1P8d03pxgqyoEVl4BP/feILo8G9wQqbQ
         fzvTrmHBaSun37imt3C+FhyILTXPPc1mSoAxMXJ7HsW37uwDIJwmnRYENQ91xDEgIxEC
         PKiw==
X-Forwarded-Encrypted: i=1; AJvYcCUZyrBAlXIGzuhqvHQ7bFXBaJYWCYl5GEP0T7GLQJL5M9KD/qVuUi7Yik7bEUn1im6Xllah4mXJw/45Xkcpkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvsPRoaz0Ikd+ZMKB7Q1Wwfqp0c953lTc+S8Hhok93VShT9go
	4mWOOu2cTJjq8VbHCBZGKo70ke2ILdtUZcVQCxS8pGurO5ohHdFElRKup5/4q5d4Wvvnikx2sXH
	bGV7iE6e0P1gl8w==
X-Google-Smtp-Source: AGHT+IH7UrSbTZN32BOx/05eHD1pdfafDslL/a9FKykKJ3ljqCd1tCecl999iQwnPEAm1PM6/DHtB7MRoBx7ReQ=
X-Received: from wmpe39.prod.google.com ([2002:a05:600c:4ba7:b0:42c:bfc2:aa72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c9:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4361c4011d4mr50051315e9.29.1734009166642;
 Thu, 12 Dec 2024 05:12:46 -0800 (PST)
Date: Thu, 12 Dec 2024 13:12:37 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3030; i=aliceryhl@google.com;
 h=from:subject; bh=pPPWX8Ivwy/gV0ty75BIy0qQGhmfgM1RmE/XDdVKt8U=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnWuB6x0lQJd/Xt6RpUUS60L1VWB5rtefkWy4Qx
 x7GTJ1d9fqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ1rgegAKCRAEWL7uWMY5
 RlDlEACJpkq1ieFKxKefZcE02/A6D2POl4XhDtXPCUbRv0LwB1npNJPz1adDpL5XnZRjCUHtjm9
 AmB3qS3xEJ0g+qBQ5s8p8ndri8gROxUdNQ9YMKf6dZer9a05hWrwUUYf5MNMjCiNdlZR+paZyOF
 941DkiaIBBdRyg+rZvyJYadqjYhYMcK439Aj7YFyelyCSl+k+jr9WH96NAIlnQIg377Ys4uu8Br
 5MYeie8SSjOtDfOi/vFfLZ2q9fzTVmQspQm6zXbR7TrKn41tHpL0lypfW35HY0WOxAHbwAyL569
 MByT8GZ76KL/p8Tmi2tJghvnaHEPGMzbJALdz1JFNShutatc6AAEiGCmxkC0omPsuSNxX2GMlmV
 L+trhDeql+LHVcoD31X8s/eF8rwIwEik+yPQtBHci5IZgQ/G5kX7tfXu4FuTINY7T9h6TIxvAuV
 nk9zA7p7/rckaVXtRFYVnxZlCUE83omOoCoGh+l9y+MeNxQzrRaHldBHfaRFRlW2aMIanTBeuFR
 lszvgSG4FthjEAbydv+bohXhRZJ+IT99/qfj7hzbIueUAkYwgXSaZwCqgZXTSonlzUrCYlXAd0H
 YaqRK8InTyUVMD1tmua/iC84JMly4iwzBOfLNSGDbpuydVzkHQNj89x675oV+yWbHzGypr1jmKE +snT2nC7oVzpT6w==
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212131237.1988409-1-aliceryhl@google.com>
Subject: [PATCH] tracepoint: reduce duplication of __DO_TRACE_CALL
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

The logic for invoking __DO_TRACE_CALL was extracted to a static inline
function called __rust_do_trace_##name so that Rust can call it
directly. This logic does not include the static branch, to avoid a
function call when the tracepoint is disabled.

Since the C code needs to perform the same logic after checking the
static key, this logic is currently duplicated. Thus, remove this
duplication by having C call the static inline function too.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 76d9055b2cff..a351763e6965 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -218,7 +218,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define __DEFINE_RUST_DO_TRACE(name, proto, args)			\
 	notrace void rust_do_trace_##name(proto)			\
 	{								\
-		__rust_do_trace_##name(args);				\
+		__do_trace_##name(args);				\
 	}
 
 /*
@@ -268,41 +268,35 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
-	static inline void __rust_do_trace_##name(proto)		\
+	static inline void __do_trace_##name(proto)			\
 	{								\
 		if (cond) {						\
 			guard(preempt_notrace)();			\
 			__DO_TRACE_CALL(name, TP_ARGS(args));		\
 		}							\
 	}								\
 	static inline void trace_##name(proto)				\
 	{								\
-		if (static_branch_unlikely(&__tracepoint_##name.key)) { \
-			if (cond) {					\
-				guard(preempt_notrace)();		\
-				__DO_TRACE_CALL(name, TP_ARGS(args));	\
-			}						\
-		}							\
+		if (static_branch_unlikely(&__tracepoint_##name.key))	\
+			__do_trace_##name(args);			\
 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
 			WARN_ONCE(!rcu_is_watching(),			\
 				  "RCU not watching for tracepoint");	\
 		}							\
 	}
 
 #define __DECLARE_TRACE_SYSCALL(name, proto, args, data_proto)		\
 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
-	static inline void __rust_do_trace_##name(proto)		\
+	static inline void __do_trace_##name(proto)			\
 	{								\
 		guard(rcu_tasks_trace)();				\
 		__DO_TRACE_CALL(name, TP_ARGS(args));			\
 	}								\
 	static inline void trace_##name(proto)				\
 	{								\
 		might_fault();						\
-		if (static_branch_unlikely(&__tracepoint_##name.key)) {	\
-			guard(rcu_tasks_trace)();			\
-			__DO_TRACE_CALL(name, TP_ARGS(args));		\
-		}							\
+		if (static_branch_unlikely(&__tracepoint_##name.key))	\
+			__do_trace_##name(args);			\
 		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
 			WARN_ONCE(!rcu_is_watching(),			\
 				  "RCU not watching for tracepoint");	\

base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.0.338.g60cca15819-goog

