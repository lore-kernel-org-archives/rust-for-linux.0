Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043250;
	b=3BPhRRguhrSuLVxY/0Ht99XNfnq+AD70Df5Q1BOSaJkOLxgBGk4uV7S9IhEzM+/afcqF
	 HS4eJUDmHD+Oqk9KxrHdavX4xyGv3vsg9e1+JJcD16yvqPPSm1mEV7hhzoex/T4xKHh2d
	 hAeaAQQMj97lmxLrVPEGWq++qp133nnbotAwmwdt/etsC37Guf0Pijmc6R/7Gdyue6aOu
	 ukYxiY+CGsEoYrnUat8pV1C4Y/iBJsr8yMsOj46KiLh+4jIULl0Bjcub0PRZu8riDmRgx
	 NmBZycNG2mekYmfV/NE0IdOs2aQzL5NdtLq/adAHckIp6rC3xVgPHk/lxCDmqalnWLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043250;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lBswnVDE56Nqurl3vdd/xXPIW522IU7OvEaa1TFKAf0=;
	b=YgJoZd/78FCwBC6c2dcXvrsB/85qOsdEXtbLxcL02aWwWAP0CWfO52CuxA6CCFVTuCZt
	 Zkel4o+ZVbMaFSjX27tkOO+KvHyzwOLh1qIxrjqiqbqxi4xXDrBx4KNBydrgBpGxqtiao
	 pHDh9rgcPD3lE6VSD9T321fSr2FHleeatXs5p/Xlh7mWePi6XcaSPoQALoqliLKghq+ex
	 tkBxmkQCYxnPia8hJOk1Jl7WTZjmdxmpgCDXjoSmkKF16GoOu0ruKf7FTSwWQsRvvjrJf
	 zS6JATvaKUaSMH9xG4aDPbniB7HXezu73wPYSxwY4oA26PS9sq5epOfX6U7JBrGa70Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=lTbmMc80;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NSHmce+d;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B130606A32F
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 23:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B130606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=lTbmMc80;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NSHmce+d
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 46F5B7A02EA
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 18:07:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 18 Nov 2026 18:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1795043246; x=1795129646; bh=lBswnVDE56Nqurl3vdd/x
	XPIW522IU7OvEaa1TFKAf0=; b=lTbmMc80KLgFmy7fGqMCjMO5DDoJYXu9qzfga
	uie0PUg6WOo6DnFM5KHmEpwq2kuMP/eeCrpoO2LpwE4G2HD8yYLAKMmeaZHm6TaO
	rYW36b7hEW4mANEQwICiDByi+iui5J+S7cTyp6/ta8IgfJIRv10UDFQROr80QxkT
	nS9amfhEhOb5bHmUyAur7fr2eoefCBKOQWKWX7Ukhn+1uYMFRxtc8ImKFWD5zzHJ
	RGXQNeQY8QDEIOqrGh+05d2mBRJPxdY8U+TEqqGHOkFciMZTvc6DTFkxdtq3HZAJ
	g5thFwHY+NrHYWzNafgYnKRMq7LcFXTkxTcTeCpXtFtb532+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795043246; x=1795129646; bh=lBswnVDE56Nqurl3vdd/xXPIW522IU7OvEa
	a1TFKAf0=; b=NSHmce+dFm7xhBAdtwbrnjnDGpM3D+dH3mJGw7iUBEaxdd7uiK/
	ef41RhbeRJNtuUhkZqgy1iUbP0KcWPXTMXJ+mOYeQjSYBwTSQDtm/NHPVee+IMeq
	+fdYqOEMxDGyXcgL9N3n2CtSZqaaQOpzC7o9BE4btJr6fCOb/3XAfzbH9v/Ayhzm
	cYTzwGHUaKUtT1XYLr07po6bHXfJa/JHUE0zzZ8PLlyanOMoFqdqTMB+ilNzLiRS
	y9JbWBsaVvXSpHA/Iz2quauDREoulnTqGQJjRh3oDT1Z5tusrF4BBjb3eHS2GQKU
	2pupYsiXFRrndMaMMtVf+ZUdTV13X4zyU9A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795043246; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:Uq32wnmjV3jCVJjJD9kdR5yzeF22qHsWoXEKXKN4sCsPBq+
	XVL6D2+2rQm87fX5UYJq/SOR6Ff/OioLR6VgZoPBs7yoWYOOgmPlxo//YBkEo2Gh
	VWCiULZkS7B8aKwC35rS2TcpeAsNhS26eJkbLyKN5YsKcTGIT1pozaCEJwuWocok
	Pi/zbukAbbi8JeYT87eDa3kbQcWnhRMHI7LA98o/c6inblk8q4u57Dtzl9ocm9gX
	fc3+6ohiwnfKHJy9OYsCHFyQObp9fKWO+CRzKqldKng7fhqNJD6WNmkmmWpv7lso
	wM/K9CmvSdnaTTkmEtS6Hs4EtKSkar/B1p4D07Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ruPqdShCNZfjwrrN9joqxX+Hl2nDZm6nyIfyo7DBafk=:igW33lYKp3a03Zxeo9f9MbOOpsB90bq9KdEzN0w7RAs=;
X-ME-Sender: <xms:rS_-asY3WThPJkapcfzD5LbWF4xPU67x0QNbODPTrAV8XyYOQOwNWw>
    <xme:rS_-ajTyoyBgEycUwlFhkBYSRvllZQN2hiPkLOOyRv1-hYsJSEkPfYcgOD3YUq6J9
    fDZV43GmobyIkxnA5MK4ChcMbK2JbCHoJ0HXQMkm0ULe9yKNi5X5Psq>
X-ME-Received: <xmr:rS_-aie_bJrgMKZYTw_bBAEilnSnjZlQrCPtqfBgplAe6I-A4FBw07WN9LKBn5p3LVokXx1nt94tHQhQRfI>
X-ME-Proxy-Cause: dmFkZTEMp3IGRf94Ymoqytiq4Tf4pxe97Alkh5G5vXQVj3rwb5PBBo+CWj39xDzyy2HBpr
    BRnPCmeKN/6lC8Rta/blavUI+k03FeC3rINl44AaLZ7tOGQM3jZJLu9NVYmJO2G7OPSbMw
    sSzoLXsO6jA2zRAAGcPfxBKC9RsFdjWx1jRQ4bRbhdHnzgkqfebCCAYqDnGM2TeWtyjLoB
    +Dzqtju9jy5aHkKwDGczLEmbhxTJdUUy5OIYfEckMUhz/NCG3ZZfDb4CNRuFSjmNGABSwV
    s7NA/iD5fibJNQLQTnzuKEOMRMC31XIR/phYst0Zhdf+tc+xzWYer97BZwaAZYsBgOGjaG
    3DyX6AIgU3Ju5kUWLy3ABWJhTwynAbKxy5mb0m0trTc5ZGzqqp5E/5769yVCirND+7JT/v
    epZdecD5N/WWmqQmtBXYpsZGziUeGvHbe6xIYUy3D1F0lLjrNUB2+StzbG8dBnpLlEAckw
    08B8d0ILd7D/BMz8bV5GDfdIyunGNy8tJletxyzbpfiBEn95YlOBoizPnzHxCijMsGrGVr
    bu/nV5gSVAdmkxBJZuFsxKir1iy+0Bxdl6+dz7XkTqoLIbpluC/G4uwrmolSk310uKicc9
    /gaiNoMVMB9/8a9Q1PWu4exEypH1AUvjZ6bJHtb4MsrNkd19TQvfSb4Ndklg
X-ME-Proxy: <xmx:rS_-aqlXcdFuD8pSf797lbITNmU48eo7Uytm8EEmcNeiH9olDP7VDQ>
    <xmx:rS_-avjhO9v4EaKa0lsSQmTFZLI1gYwZZmbMYUlPZTE2TYdTd1GYFQ>
    <xmx:rS_-ajGdf0aQLU5Pfs_9iu6mWgJDC9rzRbJoQOzbIzwfYanWIwXDWw>
    <xmx:rS_-amwVhhy8E5lP-zi2Za0Aj6ODHbd3stj5jR1s3S2sEw2CqoHSpg>
    <xmx:ri_-aiHBA8VquU93aK83NfXWfmJ7LQnmqp2Sa1qqekB7QISCGKA54eyT>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 18:07:21 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: time: add #[track_caller] to Delta division and remainder
Date: Thu, 19 Nov 2026 08:07:08 +0900
Message-ID: <20261118230708.2599659-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Delta's div() and rem_nanos() panic if the divisor is zero, or if
i64::MIN is divided by -1. In these cases the caller passed a wrong
value, but the panic message shows a line in time.rs.

Add #[track_caller] so that the panic message shows the caller's
location instead.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index aeb518b91e1c..493a4d0774e8 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -512,6 +512,7 @@ impl ops::Div for Delta {
     ///
     /// Panics if `rhs` is zero, or if `self` represents [`i64::MIN`] nanoseconds
     /// and `rhs` represents `-1` nanosecond.
+    #[track_caller]
     #[inline]
     fn div(self, rhs: Self) -> Self::Output {
         if rhs.value == 0 {
@@ -725,6 +726,7 @@ pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
     ///
     /// Panics if `divisor` is zero, or if `self` represents [`i64::MIN`]
     /// nanoseconds and `divisor` is `-1`.
+    #[track_caller]
     #[inline]
     pub fn rem_nanos(self, divisor: i32) -> Self {
         if divisor == 0 {

base-commit: 6b391eec2ddeb3ab2681cc5dee16d29e00202438
-- 
2.43.0

