Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A614A60F
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281462; cv=none; b=NjYTY1Vff5YOxcHS0/iNKIiAr8knFp6BQxN0eQ5RaO7ZspLXiUvx2zc+MoUXmNeOswMexmXseqL7gLwet7G9fm3XO/v+HjWrkl4mQdlGLQxEWvs9D3deDO7pc5MnbkiuSD3h9H+E25b3hTNpG7vKq3RKn2oWZW8qQLee6S8sMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281462; c=relaxed/simple;
	bh=mDYMGIZMDiZmHUWYczFYJ7ICxGs58c+0NvQt8sxDgsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KQoZ2f15vdyju6GyWzp7hP9BuFi5qokThvzVJ0z//Kv5nkmcgcmlXqLuGVE3BbiU+WxJ2hQ+4XrV8aU6hhCKD6JVjlpFOewNxBaKDwv0KClXNR22lSHforc28Z/Lc4c37eGqq6MGD3BytD194e55TnUW6GW7o75rSwFNT5Mfy1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VzwXKIwi; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VzwXKIwi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786281448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFa+jsYAoTkURe3VEwZJVCDmMTWNyymY+J0sTz7K3Ac=;
	b=VzwXKIwiwgm71N3bWK0Jtha8JhjTHLSF7aQgI3LHvK5lwWsGcHNUGuwL1GKjMmNxvdlyFw
	0GqmrkxGqlD8l7GvK7D2V5bRhBhbhQCZKs7KF1ViOS/l2rcNFTOec31+sHDSISQfN0+CEh
	q2xs2qZvfhqjG6i6OmwTT+pH1Tq6IQo=
From: Igor Korotin <igor.korotin@linux.dev>
To: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling I2cAdapter::inc_ref
Date: Sun, 09 Aug 2026 14:17:25 +0100
Message-ID: <178628144572.5226.7072490581990266256@linux.dev>
In-Reply-To: <DJRJCCGCXYOL.2O4HP9N37SPAK@gmail.com>
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
 <DJCA8F2F93US.1KMA54SKQ364K@gmail.com> <DJRJCCGCXYOL.2O4HP9N37SPAK@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT

Hello Nicolás

Sorry for the delay.

Yes, worth fixing regardless of real users -- inc_ref taking a lock it
doesn't need is a real bug, not speculative work.

Instead of adding a separate Rust-only wrapper, please consider splitting
i2c_get_adapter itself: pull the increment into a helper, export it, and
call it directly from inc_ref -- no lock, no lookup:

+bool __i2c_adapter_get(struct i2c_adapter *adapter)
+{
+	if (try_module_get(adapter->owner)) {
+		get_device(&adapter->dev);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL(__i2c_adapter_get);
+
 struct i2c_adapter *i2c_get_adapter(int nr)
 {
 	struct i2c_adapter *adapter;

 	mutex_lock(&core_lock);
 	adapter = idr_find(&i2c_adapter_idr, nr);
-	if (!adapter)
-		goto exit;
-
-	if (try_module_get(adapter->owner))
-		get_device(&adapter->dev);
-	else
+	if (adapter && !__i2c_adapter_get(adapter))
 		adapter = NULL;
-
- exit:
 	mutex_unlock(&core_lock);
 	return adapter;
 }
 EXPORT_SYMBOL(i2c_get_adapter);

Heads up for v2: Trevor Chan has a patch changing AlwaysRefCounted::inc_ref
to an associated function (fn inc_ref(obj: &Self)). Not merged yet --
rebase onto it if it lands first.

Cheers
Igor
