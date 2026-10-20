Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508178;
	b=EmIUTgOwjW7DbkehwKS+xNtbYtbKE122/IzfAvg42slRrzmPURsqyIxhO6MByKPAZHWt
	 fKYqk5IQpXLmsANWoaVdCSNXp+a9UCDJlQyjZR2rdxsb5F2QBcM/cdfqeFWqfBXqrd1t5
	 7W9813yJO3qTLnBk52RZ/JYM2l5U6RwyEeavY0qcq+ey9prjFtnbWBKiKe8j3x4HHFYyH
	 lPlNo21j7+IOwOp7MAYf1TmpauOHSFX5Sdjsl8ZRtKy1fzvIFwiXAkzjAvBwDC8b8NOhf
	 sAit9dCkDQothm3aD2/9+Ak4FFlEhts7Q439Fu/Bk9pMwXk3VknItO6NZCQj1/MsRZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508178;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID;
	bh=yOvWzCOAzttP2EAepfF+N2EBOK8OOCcBUIwHH7Y9d90=;
	b=nFfATQUGLGCZ39yUCEGzRR8rEQlmI7kFtB2LkHnZJKrMVC6cg336mH2JrWKhICe89T4z
	 ib23TTcxLY5WoalML8k1UWWk3zvzVm/JILF4e1YXu2JN+/JxmMMQrQ2iID2Wzhm2x+Aik
	 J+B9R3T67PgbLi1FnSSnvwkD4V0GQW2QILbgnxQ1oOYFcFILqlwDlSoG1fAtKAy3X8Nd+
	 KsPiPFI0ZNgiaJgijBuIQXpM5fI3N562QV/RY8WzJvdSdJb3V5Vnd6vJ6VJhumTvx6EvT
	 hEIBiUSAJXxTMjXgB5bTuKOYsiPJQ+7WK95TmakxeXJCx0wdnOnJCUqCTZnbWcDfe3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a1xiYpYt;
	arc=none smtp.remote-ip=91.218.175.5
Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A80606A31D
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 14:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A80606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a1xiYpYt
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yOvWzCOAzttP2EAepfF+N2EBOK8OOCcBUIwHH7Y9d90=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792508174; v=1; x=1793112974;
 b=a1xiYpYtEAUQrgLGaLMfILyWkIDjwCIJxHknVsgvfNwLLjK0oTs1A91USSmKqTF2sFf5Ye+8
 83t1ASEVwB41JNMT4ra9X8xSTor43Mqq4dt3LL/rDKfgOwmfNiEz6+rzRhVYnYQgLpr2Av7Cn01
 z8k4pHbjfrydRhIYmc8/jQkE=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 38fd257b22a290d5;
	Tue, 20 Oct 2026 14:56:14 +0000
X-Mizu-Trace-ID: 38fd257b22a290d5
X-Migadu-Flow: FLOW_OUT
From: Alvin Sun <alvin.sun@linux.dev>
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
    Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
    dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 04/11] drm/tyr: add per-file VM pool
In-Reply-To: <as7IqjINtIURG4yi@um790>
Date: Tue, 20 Oct 2026 22:55:08 +0800
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <5c0856e1dd1ecb48.1792508174@smtp.migadu.com>

Hi Deborah, Daniel,

On Tue, Oct 13, 2026 at 05:11:22PM -0700, Deborah Brouwer wrote:
> Interesting, I see what you mean because it would give the caller control
> over the vm and managing its tear down. And it would be nice to separate
> the creation of the vm from inserting it into the pool. I implemented this
> myself and that's fine if you want to go with adding a custom VmAddError
> or something like that.

The v4 series is out with the pool reworked using Daniel's AddError
approach, and the rest of your comments addressed.

v4 series: https://lore.kernel.org/r/20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn

Best regards,
Alvin
