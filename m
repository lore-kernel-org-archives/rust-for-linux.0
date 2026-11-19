Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097582;
	b=A0pdYCWP1e1mrjbEk6IMzxMYEBHOQnSJ1M7jJhlyGrl+pQwxWhZ+FX8Xs1IGpteyIx41
	 W/v/Q+PlZMHNydNponsdto8HYqSmkGGZgblQansVFifULnwFY7ghYEqfqiDU4kWhc+Z9E
	 2FgE6Qq4yKxTSIOvpkYlz0GRn7Dpi4W8t/nGgRgLCqT1RE8NeVqVi/VIunjBq3IiyCvn5
	 LF0AZsvpeU30YjTGi4GP0xu6XQ3LSObcHRqD0v4QzExmsRjOoqCXuKQ0GckcjujyudHn7
	 ZRXgJQfvCdEYDZajMis219SJmUvpA7ACW3Ew0fjYC/kMUoHeoWaiPshhI+qXeCobgFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
	b=1NMUCGyT7708rFjU1VjQ4U4fBbmnBw6bA35ou7VUT5Q1hvrU7XnminvjV1sm1g0fM7D2
	 04ZTngTeyJ71MHL+xbyYC24UJzJEwLl8eLZDpG8VLD1waPun0Y5DX3iLR4fXGas41xNVF
	 uTw6L2o72LoGXhxV5TbxeBKiEBYR6yFdM6188ebDZpNR2ISd2lQZofAwxh1A2k4PlXf4F
	 8HhGG0ZsdOWxm46Dk6KTM99izOYqsWxiaocxrr2pETLqe0STlhS5o1ejB+Wv0eIJJcw+C
	 fp+XeaL9hJPo9jBpIEzJSsZXkjOuaNrFDiCLDrZZbyPIRUr+9zBkEvttzYSUae0jMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LlHQjjJf;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CF260A2620
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CF260A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LlHQjjJf
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so1767235f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097580; x=1795702380; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
        b=LlHQjjJfSWAFpz3qfXWQiRTpYRtVQLe8k5N9agBpMdsMHh7Kt7CoBZhKETckNNo7Ve
         VHkTBc5hrMdjBbxWS8RVlc7/M6e7SikpY7GgDgvxrUvGdNnpokc/VV+1bTR7/t5CHNxX
         NdQK1FZ8muRM7jmmynAVDN8OqjOjE4LKyOQE1nAc6eckrx4TOXft6FdkWZIh573mTYS5
         RgiUHeXR7YsJ3e7RZi0AiPjQXkuxJ22c32WPcJIYrCSlNSupcCrCAJvCKfDZ9u4CK1hn
         VmYKKhcFfmxRhY02irvTAe7l6OlBNmJmEf+CYYyriCIN3hjdQ9o0OkKGxWv3t4V3rTHU
         W4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097580; x=1795702380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
        b=knv5e2fC+KYXHtFFjBK9p/8SxU6JkjvbPVd0nYP4pCu5oCUKWBIUxgo2fck1JskeKC
         FjOrh6pvLZzVwrwIpR8mUXYtLJ2W1PuZHfOl+N0wHwX6jaGgluhydXchozIi+DY2zVFB
         A61iRUf80eLZnuKEIG5w/nMD2rQXeyp0v5RBkqQ20uYbQz93GajSxGGr92Vu/GNIwQ9e
         WonVWCVe+MM5+k0pTS1Km/8oi/JBQVubVR9swAY32WYS21kYNlMj458js1WGg3uVgkyY
         vhy0OLVh6YDx+T2aEF9Iq6G4GkHVa/mC2bPb4UdE1t4It0BX8Kv/n5/iRMmnQvXa6MZl
         UslQ==
X-Forwarded-Encrypted: i=1; AL+hErE+TrzgBMGxgOo2CI5qvMGo2eSTn6XUy06cmC41ZOQC/PnGhrTD2c4lNwt+Owb1W+Di5IcwCWSSohYMJhcB3w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+M65bBtpi1xrmEB/KASS/yH4BPv/ZnRW6w2zvPY+i8JsZtW43M
	KsPcM30q0Hiq+ROps8Ev23IgxhjjVZo0AzHlPxLJjEiGeLpfD0I52rIxOLmn6IKJbqAo/0FJlDx
	N81QcyfJMq9b4m62KwQ==
X-Received: from wrob15.prod.google.com ([2002:adf:ee8f:0:b0:48e:d59:85ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2312:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4a63c6590f3mr13110796f8f.42.1795097580124;
 Thu, 19 Nov 2026 06:13:00 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:44 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8dTFAUonXyEkYL/wNlIdqEDt0bd9IpV31R8kzKFHvmk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjARfxvVTAMK4l8BhuFbpAzEG8l6+qpcHqZ
 cfRD3c7ALCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RpnED/91VIGr3SMg9ThB0WCISSggasOnHr8OML7VCrcXnwq0UKb2vwaI0zt4AGoHrZRhI3qjJo+
 MYEKV3UyEeQopABjBbi7R/Bmx6tFec4YIIJepzh/VCWTR7zvWdUHh/ec0pbgExBrNj+6fgPW0TR
 0qM6K0+w7C5/9qKjWWh5zSnoVf/yUxV6Nbq/NEKKjxivJ+pDLGr953TIzBZkeF41mEyshYXZmBb
 rYwGC03xarVxkBoTIPBplpqFZDrl22+9Y4FIgpzKeIARQNmjshJCfqqVYiiM7xdQ1HgFo27kj7u
 mOnvEUSL3X6oDGlHqEG6l6LWxygpDTXV84dDT3fY7UD1juMCpE2q1qGR+r0YuEWk3bvMkc7rA4i
 hG//99d6NFQBlKDU7y3KDYN+TUJhyeZNBSNWWZ3y2Y9l3wZam9BCpa+pcACbfcJpD0H405EJVpt
 Gf0n+mMcQJ1h5ILlyeblNqwbxq0KONGHVYSNmpiTzbwPmEHItO44DsZSrM7usHt3P7T0BnQsV9H
 4HXVZSPtbslryRbc3eVng3aYXjlE4PBXvVIZgPLODN6bLk/4CB1o26D2cObOLHW1wRS1LUxgc4s
 NJRST19b+9LQbztdmFaWMTIcQPSKufNVip+j1Ye9ykscRymsX/CUGmRsoxYySpBuftIuesTfMpg A3P8zazraOC+gXQ==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-3-707c68994940@google.com>
Subject: [PATCH v4 3/5] rust: workqueue: create workqueue subdirectory
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..9d5e2278f1f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30299,6 +30299,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs

-- 
2.56.1.708.g77570a6a1d-goog

