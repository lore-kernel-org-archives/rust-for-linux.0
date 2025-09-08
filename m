Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120B22256F
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347381; cv=none; b=NF2gS1FCM7q+a+YgX8LyNuHLe4uW5jnsV/H9zjacYXnjL+URloa0zLXi9UwLxDSxFJuBlN0SZnbyBoG12Gq/mAkmSXFVUdNjlOMZu3n9LHCBRCV2kh9ptHi23DlkG29CnnDklzlmovrWPd9mSVAQGF4kDLjpYoah/uJqhttjuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347381; c=relaxed/simple;
	bh=cpDYRZ5IJhjkKjhFzJ1vTz1M6dBiBoRAu8bYqSbinX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdBZgXkWsu3DQ58fSSqLUFXi7cXjZoNx1fqEVpTCeNXHvgxdWEWr2UNPWwxSfTVzSg6pn0aQUccnia+q6B1hj/8QFYu7ILam0Bh0MTm616J30QXf6Yo7WzRATBj4njYZ+Gd9CTYR9n6/fLJzTjCVegNyOv0eOwSFdOCmBfJaDKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QZ18XM7w; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QZ18XM7w"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de6490e74so11037075e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757347377; x=1757952177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj7LaxgEoUuQSI89v+dCyeAFlR0ZKT1Zqyn9nsiJnT4=;
        b=QZ18XM7wxv/uLQ1iwjq+CEHfcCalB37afHEqyXe70YAZUrxUONOo/lUCtt8d72WhBY
         z+R92dZkmEFjv1olsm483JkPwHsG2Z5VE72wJ8FoQOuTVUiCPEWgtWpSrdhUQnE0hfH0
         m70EuSmzihbtJYg6FuEtWxRjNqp01zDTO9eiHvTmeOEdpuMI7ht6YE2UuOcAN6inn+2Z
         yeq6gkBpQ/yOgODTbbwy7WnnTO7oZ2y7CsSnNZaJX3lZLPy8Cb/9p/NHYv6teWeLrWD6
         pwpKIkiknhBU2E6Lz4syhqeM0x1txLADEb54bn9ToSKxuzMH2M1N97HZorFpP5LAigQ/
         Dt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347377; x=1757952177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj7LaxgEoUuQSI89v+dCyeAFlR0ZKT1Zqyn9nsiJnT4=;
        b=Qp4HVUMQHVJQwKLecdwUvN9qPc79/zfHKxO0dlAJouzxTL/3iQ1P7GRT+vmO4bGBH7
         mQvaku/9yYSrLEk6fbI1C9ExTv3/KFtRHgzci9p+FnY878ZY2c+wz5eVvUlRP/Z7fQ1K
         bkF71ibh11uOqb7R0X5/nKJXYOiZmjw7r89sRD4XmQexni2RYW38/oj2nX+eMZB3E1Pf
         vPBE9f0ZN4TSWW6omyGG/M5G9J0eRniC7EFvnIN6SKDNo6ZpwTfAMLYZEmQRY6HBtHWs
         EO0hc4RZ/qc9DB270IHzVLJRv3mIZb5E6FEPVwDpHrgZ4Hf82quHQrRtfSVodDuIaEUv
         olIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW821ACyfHfwMGi0NqiQg3liq4iX6wT6rKqVsTeX8a5cmGZrithn07H1OqENAHv2Oi+q8naLvnYJR1tMFkvBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUr/tiqQpVsmaj5iKHW6kuNjvfL+1Oy9zP0BOeE1h5KwQzL82D
	OpvFyiixqbW7tT7f+GvThUbFvk/e6gD54dLcb9leuWPoHxSptndQTNbLfkaKK1QhPCuuECHo6G/
	BZzlA
X-Gm-Gg: ASbGnctcyZ9u2w2fer/VO8aks7zYEErg/hVNjv6vGFs1Nl0MqRiqvaSIehBPu6Rv40w
	OUUdmDu3+CpyaXMdNkjhsEsymcJAVZE1um08qR68QeSrw635xiIDVNrIJduqjcn1EL9dEz54EsP
	31XWT8Gk+MTIb0uC1oRFtH0Qrs/4wGS3WxOBPeM1+WQduIDNdtgIVrHkjsDkDSsMdaee38oVhRF
	bxnZMjVYUIJwHSKM20/x53ukcU/jkSeig+lPVPJBru4SidpYlzq8RPW0McAZK2FYe/vhz5nBWEs
	TpMLflUD55P8OFlaLuQaGL42Cjdc4lTFZrbrbZYYyfREuQ0h2jORlVhgIA4zHIkb0OiBBuPCGG6
	1XpLwlAnNaB2XEG6f1MsOiPGL+3w6Hho57hoimqLp/XYYLY9W4FCCs9THZHit1kElPFeX
X-Google-Smtp-Source: AGHT+IEX/q1lpajvUzRGZ7zwJQGERd8WvN74KuDFW6tkBrgWMYXBbT7NDFXG3LRhu8xAfEpSq+e1mw==
X-Received: by 2002:a05:600c:474a:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-45dddea4cccmr83152635e9.12.1757347377212;
        Mon, 08 Sep 2025 09:02:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de5eabdb0sm55358075e9.8.2025.09.08.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:02:56 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v2 2/2] rust: replace use of system_wq with system_percpu_wq
Date: Mon,  8 Sep 2025 18:02:24 +0200
Message-ID: <20250908160224.376634-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908160224.376634-1-marco.crivellari@suse.com>
References: <20250908160224.376634-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users. Make
it clear by adding a system_percpu_wq.

The old wq will be kept for a few release cylces.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 01e331a1f11b..8fb16d1015c9 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -639,11 +639,18 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
 /// users which expect relatively short queue flush time.
 ///
 /// Callers shouldn't queue work items which can run for too long.
+///
+/// Note: `system_wq` will be removed in a future release cycle. Use [`system_percpu_wq`] instead.
 pub fn system() -> &'static Queue {
     // SAFETY: `system_wq` is a C global, always available.
     unsafe { Queue::from_raw(bindings::system_wq) }
 }
 
+pub fn system_percpu() -> &'static Queue {
+    // SAFETY: `system_percpu_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
+}
+
 /// Returns the system high-priority work queue (`system_highpri_wq`).
 ///
 /// It is similar to the one returned by [`system`] but for work items which require higher
-- 
2.51.0

