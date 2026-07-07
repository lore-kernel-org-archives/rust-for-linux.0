Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F153EB0FC
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420150; cv=none; b=aFJUV+OLTrJwdMrHOQZwYf4VXR+c8G9UusHnVupt4zNRWe1Kr8FlglVzhP0eG9H3JscB+Anm0Hl2HfAX1xnGnzWL1Z4c8FR/X4io4EYoqhKbc9uJR+v/mND1adU45rdhCWV6rEPVCiyLJoRfEvP8dJ/pUk+hnohPnzY+jHdw0Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420150; c=relaxed/simple;
	bh=d9uo4Ov6IB4poq5LyLqx4MVAIcepLANVzyDdH34u4Qg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MjNi/JrdGXqIYOmeYpdRDTGSpA/iM/yxU9OTgvdoLHuyHLjZtmMu0WuuNRCQl/KmN5nkJoTvp852BSpnX5GrcUJn6zaSM1JsQIVdiOCdojAvztF3xMNMiB7M1WFLNm1ylwXEJRSffo7vJxQYAmS4AyKMQYlp0+2+x+Q94D5/AfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=su+l1fmJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="su+l1fmJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-476d52b13d7so3059205f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420145; x=1784024945; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJWJ4esPjYUB4cc/xhqnzZmWu+Yj9IGbAXKLMFjEL9U=;
        b=su+l1fmJPEvhJ47Ky0+zvfRgQwBzULwLlqGhFJVpZcGUVA2qjZg9pl18WHQ36jopLs
         xz7LEK9u2geKJAONlOgtGbHrVAhOmdFkzp4RygEAriJwDA3QtsqezHwbQ5RDhGNf9vKY
         j9cr8LLhOmKt6lOIDAhKnv5FG1N2l9e7CBNwmjJWFnt5jPvEwqRn/QkWcNR9OIeu7AOD
         fRfR28m3cB8yXSi9uw1Q7ZAApoRZ6bXcPLZp/VKx6T5AabO+eMRJ6FuV8k4wcj6prbIQ
         2Fa68oPXEsfPwhFzaFB6cK4a7/V21BxtQjYLiqjs8qCpL4Ekry6gDbppOQFZ397HqcZ9
         lRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420145; x=1784024945;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJWJ4esPjYUB4cc/xhqnzZmWu+Yj9IGbAXKLMFjEL9U=;
        b=YUGDbY9iPk1s9atN2ZX8cOmHr8fwtgDecbdWRZB2WG8C2srevFGdbmQEy2v30u5vcn
         Mr00frfMu/Hhie4G6s8y8EiC9ark2xctetRxYB93sysMNFmCsOasZFjAunSWUIwU09+t
         D4L4DAY7nrerPskQE7xlV0jkRIat51+DvMiUbTEXqw7llvkzjCrSYAIEYtK7MAGJknpO
         LJkCVnbbu84bjhhzqcirp6UWzewUw0yIjwxMUU4uqpfg5v8+V0wRKCcGPWo3/vMBweTr
         /wbbwk2O0Z3Wvpct9uPM+3CUjNtIXl7tJpU31ADIJcqZPRHtdxu5DhdPmQoo5KJnfNnk
         +EWA==
X-Forwarded-Encrypted: i=1; AHgh+RqggOkJLlxshKma5TDrAphFbA3a/TKmK8MzBoerJsuxf/IUjga8VjskL4QhdTegQ7F6de3IOqY29sPUNbwiQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcwa65g6TK84Qf3zjnoYZrnUVtNHLLDmpfkYebaHNsxWPk1gs
	UtIzht00NLhbmizogsW/0sC8xqeHHZlwirY1R73ZewPracVkr2YsAFeaCl5tapVsXBFeGeAyX4k
	a5quIeKOVnyXkQjmN0g==
X-Received: from wmqe6.prod.google.com ([2002:a05:600c:4e46:b0:493:bd80:da9b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19cc:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493df0930a6mr53083905e9.26.1783420145097;
 Tue, 07 Jul 2026 03:29:05 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:53 +0000
In-Reply-To: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=d9uo4Ov6IB4poq5LyLqx4MVAIcepLANVzyDdH34u4Qg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTqxiDDl2Th358yp5g/ZfXTmA1c/6R1sMupu
 lcDYLLqqFiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU6gAKCRAEWL7uWMY5
 RgFUD/9N3SHUyo1n2ZPmqIJL4YMTAAPBEKOGWiB/o24RKZGkL6Bh3f6Goa+spVc6tHg8O3rpo2V
 hMtLSulPFS7RFtpc4y6zzRgJn8MYDKdaYgypKMYQ89vqLn2GMEoBFcgEN3zCOIzvM7UckmOlbRP
 VM6WIitl2kEae0kzGWM9zgc4NrQ5qWFH+2TDMU/swBRSfRfykEy+h3OGpzTd39nK0Hd199NeDP4
 iwCAqWQvkoWa6T+QWfsvEVs1GT1GjMgzEJI+y19hP6X10ZyyF47Cf/wfs7oENJPm3cEDIXB/usM
 wBu5zLSgeeiQ1EZFN+p+edq1XopN98jo0eDrf61twJC+GsdKnTRCrSqPes1xDi5UYUJnr+AFWlG
 xPX+IgZVYM6vFe9BvQtOf9hjwt3PCzm+rKkP0RE20oAcFmDOsIT0mR+YfYWU5Ccqz3fDqOjsK8I
 Fh9UCCwg4ShlHtuUvtFPQdByjsejsmZqSsn30y2HcVuak8u0CdffCHZyZeuQbv/klUYaJiBv5jV
 /20sR151uyZbqADhjrk+TJQ3Dy88vf2akaTII54bLf0NJbxU4bBJ6ALB5yuequOSKLG+wUbPLwe
 iVODejqpzADmvfsyeMZtOIn+6Oe0i0DkhDO9n2XRqJMZfUP1pvnP8gn8Ey13It6seFQQrKWy9Uv BmQsP/wTVb1idXQ==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-3-7c3c8bc16339@google.com>
Subject: [PATCH v4 3/6] rust_binder: schedule NodeDeath outside of node_refs lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

There's no reason to hold the node_refs lock while scheduling the
NodeDeath to the thread todo list, so don't. The call to set_cleared()
is kept under the lock so that the state update is kept atomic.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index da84c0072d46..505e0bc52748 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1303,7 +1303,10 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
 
         // Update state and determine if we need to queue a work item. We only need to do it when
         // the node is not dead or if the user already completed the death notification.
-        if death.set_cleared(false) {
+        let should_schedule = death.set_cleared(false);
+        drop(refs);
+
+        if should_schedule {
             if let Some(death) = ListArc::try_from_arc_or_drop(death) {
                 let _ = thread.push_work_if_looper(death);
             }

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

