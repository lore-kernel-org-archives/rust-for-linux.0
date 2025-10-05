Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB79165F13
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Oct 2025 01:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759626668; cv=none; b=m/bDu5zVMvszt6I/oXDTDno+UFOawFKAb9B34ZjlQXpb/fBB9BvFdXze/bmaJW6qzv30FBJAAuraJC5vG6ewG4h7Ig1ykcjDGldoypt5wj8bTag9ro+BvUICs/7epT8uO3wQs6JpA1q0uG6X09PSnKPi2IvKNF7u8I8jwGA9BFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759626668; c=relaxed/simple;
	bh=CaGXHLH/DXwBBr2/jmC0yukKlVcNAe2XnJ4WlAHZj3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzcueh4QmMGOZycTqywEsKPA/Rwn6l1lDS3NEc+FONgkYUpPzbeFe5rkDmjl2Ec0joKzSGM7kkRjWkNXLCA6F761anHWVhBdU1j48uYrz6NFCmP1wYcyDYwlJ/cJ3KSDeqddr93Y3nA/57j60VVHdHEnBTcrK0HHIkdlyn2afdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da99MFy+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da99MFy+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so5499359a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Oct 2025 18:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759626665; x=1760231465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJyOkytP/4T7QJZkkLYSODGgdQWKJzRCxXSDdPVWq/8=;
        b=da99MFy+PbMSdweXwWhsDwhN0i59mJA3Cbwr9mx3CuQ15/Z5Nqs8RX1mrD8qLokC45
         8bkHC+rUXg8C6MPXo+yjf22tY6o6z7dZD1FH8Mut61rBl/eW9xgWXzHfFINtI3dAXrIt
         TJa3WBgyQvP1WaEdu9gCG4EDbuhwNEroBFJqChCA7Dv0wHR6bpkYxYmXjnHDohoKGEMr
         ACNwHwrOiv6a2hNyZN2AJi56l9NIZak/7Lim+XX+c52icwaflqlmRJCOj1lA8LZWetSo
         8FlSQlL0iaZ/0YZzZ5/clE0aEZoGRskAVqZ3U+H05ZxbuhkQ+I9PYwL9tijdn5yINm3t
         QRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759626665; x=1760231465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJyOkytP/4T7QJZkkLYSODGgdQWKJzRCxXSDdPVWq/8=;
        b=dEkzelKg2C//ixbZ1LPdm+3BMD9XLUCME4jA62rhyPUAzxvDH9TDin/XBUG07wZPla
         ft3yqMVp/FBBcPhNt/6jt8qt8vGrR+3y7D+4+UTIpdFh/rGMzKh7pmk47EIM1WGAIbuf
         XlbaccqLWUGiiakTEz9+Ux6bImnA5ItfvSJfmbLKgiWKZx2UZkE8j/y9AY+XWruyuTIK
         JxWzH4/8QObZuiBYRcOcbQozdiF36jIlP/HHQizt82c/70OwyMvbBwDju8sO7ZCWvaBe
         Kmvd5xCVVTmFJMHPnkTtCZBs78WKwdSwZo6Usx7M/ckAnexJyo0/83L78i4DX5XwmMoH
         a2dg==
X-Forwarded-Encrypted: i=1; AJvYcCUMIjGRR+OZ99rQkLfP+eyPYL994zAl7av3avV0JR4jG16ka3eOwTiwP1vdBLUmxMZieRj7QDbTCY+56ECtgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzrP6487oUx5UM8co7h85ZTQM6Bal7VEPcu/K1XG1hCPvekY51
	k4Dr37z3y2XT4fzGyJvrX0cSBF5TeGK9YRHyU6+KkDpdQvi645DYDVgd
X-Gm-Gg: ASbGncsaKWQGi+bhPUtaUK2Ph1X8jnpKNa2oaa1tkUgXF8UJ72V7uQbvzi+UIpQcwMV
	phhRTiUTDgKOVCCb4DskoiALyx645hF3u1jQiDPfgQTAF96wtc73QfAJdb7eBb6+A9c6/zddXZO
	du33qJ1HUdHq1wm7VQTFLKXVY1XWRLf0PglexbE44NOgAsd/MFfhLkT3SxLuJfRLrS39PApTkS8
	ywe5Ncm+N/hJRBAPkD2dzXJ15V6KjyAXTvQnZY15BVcnwDjS1GZrh6Ch76Xem4gkMBadzK7fXXf
	DLVA2QiH4XvMpMFXbjN90HRxoRWAkxzCEtPXdjpc2RfP3EvpnOcW4YjhV+7W5ohTyx2ku+3YO9p
	6O3cVjyBlDJlDdCCWi54FCDaEkmEmRUF8wadRKz+CaT03XqEZ0n2r8n+ibl+8z/+7
X-Google-Smtp-Source: AGHT+IG2JHkZbVmxw0BSVWQUDtAW3CvyW6jcfDbCRqfhUgKCZ1TjqKPOpf4r+o/oGRMoBnsYj084Gg==
X-Received: by 2002:a17:907:3c8e:b0:b31:ec30:c678 with SMTP id a640c23a62f3a-b49c525ee7dmr904311866b.57.1759626664728;
        Sat, 04 Oct 2025 18:11:04 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b48652a9bf1sm802257166b.13.2025.10.04.18.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 18:11:04 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: thomas.weissschuh@linutronix.de
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Date: Sun,  5 Oct 2025 04:10:47 +0300
Message-ID: <20251005011100.1035272-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
References: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Thomas Weißschuh" <thomas.weissschuh@linutronix.de>:
> Enable -Werror unconditionally

Please, drop this patch.

Never enable -Werror unconditionally for any part of build.

I often bisect Linux. And to do this, I often need to build very old
Linux commits (with modern compiler). Unconditional -Werror will make
this impossible.

For example, recently I found this regression:

https://lore.kernel.org/regressions/197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com/T/#u

The regression caused by commits happened in 2019.

So to bisect it, I had to build 2019 trees using modern compiler.

-- 
Askar Safin
