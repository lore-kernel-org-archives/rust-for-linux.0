Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360EE3FA5FA;
	Mon, 10 Aug 2026 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374230; cv=none; b=hCHiygaVB5+rHUW8fiF5wjLLN2SiacqEBS/JVsy3amlS62/EEYByjHmLS+GLF8VZ3S1jGBJEEMf/Yn4fo3LfA114HX9Lh26ChNTB3/hG0H62BM0Fcewvk98Y2W7icXJSBLwY2DKnuhncXiN4xLRiqcf/n1s4khe9N4t3q/ahxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374230; c=relaxed/simple;
	bh=daV4LnZ7NKOuZCkeL8lJPuTefk5UaLS44C+2OBgXeYM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mkr0F3zMeRw8dDq+j492lYBtPgiTA7sQIuTAayobegwNY9SdMvSTTic5IGwcGAB7ORQ4Ny8Y6Dsja/4ZJJNy7jWqO5HsP2ez80OHWeqZpivHeq5AasU1+KLmC39d5IKceyHn2DCAxnsYSlLjI98yBmDNzNdOXdeFYwBmnN8rP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikolaigrlica.dev; spf=pass smtp.mailfrom=nikolaigrlica.dev; dkim=pass (2048-bit key) header.d=nikolaigrlica.dev header.i=@nikolaigrlica.dev header.b=bZhpN8fx; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikolaigrlica.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikolaigrlica.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikolaigrlica.dev header.i=@nikolaigrlica.dev header.b="bZhpN8fx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nikolaigrlica.dev;
	s=protonmail; t=1786374218; x=1786633418;
	bh=ktekUAfD55Bj3KurB2lWfXx+6NBFbnQCePN7/A0fsN8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bZhpN8fxC/SfO9HGxDSV1HmVTtr1lypKfsiL5IxGyHwUilpox8Dt2jxtCwkYWuoqz
	 IK7LFcGV/gDcMqAO8/YtsuEIphjYqnAOwUj8WmlYb1bj6icTUunUJmiJdA8IemhdcV
	 /k8eMH2w5FoX6M6+8TnHNUfDIbMZPyjIN2FPuM6vdtRVSJ8cmHTHkJT9LazZlsczKC
	 Kve7uCm/3/RTBrzEDP7mfYupjXoOLZPvGLGaZi3OgvJlaj71UF3zS06EKSm2WSf8iH
	 TxOjimzbokdcAVXqnDBz1lK787SY1cTEhJ/BTi+EdYLSYuyGMWvCq+HwXcAgJheHxR
	 zsqTArnKdve1Q==
Date: Mon, 10 Aug 2026 15:03:35 +0000
To: Miguel Ojeda <ojeda@kernel.org>
From: Nikolai Grlica <nikolai@nikolaigrlica.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Nikolai Grlica <nikolai@nikolaigrlica.dev>
Subject: [PATCH] rust: kernel: list: fix incorrect pop_back example comment
Message-ID: <20260810150322.61809-1-nikolai@nikolaigrlica.dev>
Feedback-ID: 207127000:user:proton
X-Pm-Message-ID: 5b74ffba04b0dedfdac580ee3a052f5a2f9017e3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The example uses pop_back(), but the accompanying comment says
pop_front(). Update the comment to match the example.

Signed-off-by: Nikolai Grlica <nikolai@nikolaigrlica.dev>
---
 rust/kernel/list.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 406e3a028c55..0f367264ee2e 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -249,7 +249,7 @@
 ///     assert_eq!(list.iter().count(), 3);
 /// }
 ///
-/// // Pop the items from the list using `pop_front()` and verify the cont=
ent.
+/// // Pop the items from the list using `pop_back()` and verify the conte=
nt.
 /// {
 ///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value.foo(), ("a", 15));
 ///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value.foo(), ("a", 32));
--=20
2.55.0


