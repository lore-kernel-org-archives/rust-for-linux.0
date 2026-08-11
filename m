Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A54384CDA
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428638; cv=pass; b=hgWqUCXJEgCUlTxIAASu6O+2maLKl0LIwfmSm+4qXwD7MMjQogXIwKSdSHQfl4H4Oh7ElafNN5F6c8l5J+PQtabIu+gOM8zx9EZxEAYX+hQSJJswEOiU0f3VzoAacNoHBtPvrSRtwA7DULSEurxRwBI2cYmpzo7AIngyzQTX8cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428638; c=relaxed/simple;
	bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enqPbeHASC8X9BxxdTZZ5VNLqkPzM4KvJm7SJIh1EQIcMimLA9M8w3BPhoLctbMOHHEJANN66MJL8LXxAGwnsUyuPMmw+7TwCuMO4qhjnh5fJb/1PowMEZLwvxLHyfbCwaPoX23RTqpbYPiVv0z4XewrxuKu1E3hQN1eaVTHW2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQbO2D8Y; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQbO2D8Y"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso205427a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 23:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786428636; cv=none;
        d=google.com; s=arc-20260327;
        b=J5MMey5YCXeff7RDdeubxyLRqu3upOlWTXlV5zj+A3gH2LeuWFwLl4Hi7CZQRk162H
         ook0QeP39KmugEMYDsTpYHshJjcsSddDxidNFzwZ7ApP9w44y8hMWWcLh9xvEmf1Mf/t
         4J0/1Ik2NkCrQeXvz2Zj+zZbhwOVaJ7xW4fVTizVH7dYcJaasggy4nGOZ7GSIVT0JjEY
         TCwxLyBwdmIFteqJVdeHXWs9WzwZrA8Sqv+F4zULL+6qwiuyWZrq5GlFF3pm9o71sJEK
         GFBPdo4tAKAbAfB4wjZIMlnYvu3sImtVdOwAipbz9rEEHZFpatq+1JX/G//egVQ90iNN
         MGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
        fh=U6qKFk2Bn0+y/ekK/sk25Mto0JC8coXWcQ/QAbbIK14=;
        b=rm9PS9m7RzO5T3kNLqxgiJ9q0r2FqzTtT//Ke6zp5X2GBalo+OX6+5Y0+Q/1n6ltFd
         YkkEI9UaryvMgGhvFPzUOtmO5mS2p1Y0VT+94NknZLX4EjHD8j1dpNeYDTQHgIks3zE9
         iYngC1WXkD7ckjowCISnGJHfSjdaYw2jmqxF7N0zw3SYrfXDvX5dZKtHGR6q4TVjulqu
         49j8zBnbt8bfio02vuGhRxqHUrM53zTKjETUgASz9abCoquMowEbiyhRKwmVXhg3jVv1
         2YvM2eo+ofLHBVdZNgi5Ou8MxnP3GCGZilBoU29UmPBkAWVxJ+NGMotVEw5acceCGEki
         hwoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428636; x=1787033436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
        b=TQbO2D8YlMJnPznTxEFpU3FCerBnGlvBojfDvP+AFJeI4JfnU8QGOhyrAGgWRHTU0G
         tCXqakUTjKOGFUVnXDhJMtwqkJlhuFmvF6/b4mp+A1H7B9YDQbVVIWQvokdqvEoCW8lX
         G4p6EQbwMDO0Bp8RK+XEdyc3/rlIFNDfExSGJwGrSyOqGSi/563Tvi483oJxkpLasLA9
         Wk44zzzcbm3SqTXV+TQFQDitQhjc3Ikv7jfLXHelkR3f/kUD7RY0vUCN4DT9mOSCEIod
         jqRaNdaaRLJ67eyTdWiIImW/ylaXq4/a0t97XMACBn7VzNFwGa+Q4X3Sbh6qTKoptUdy
         8U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428636; x=1787033436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
        b=FOblxIZLcWtJNp05WlDBpbrqio4RZ7Vp6GExQjWl7jQf3xQSrI8KRzpBbvyzf0Mfg6
         eO1gcl8st06nFoOG4q/uzB06DCu/4gT1Ib4aUbhW6SG+mG1QJtGBHdDtyJXokvKiuwIS
         bo+UOfvVQjQgB6x85IKBKIFntmkc+iprGvg9FnIoe+y1OYtLOqAGoGHdJ1dtx1hgnPIU
         KushIaBBPGdXu/oolYgAps0oJqlBMluVmI8pU6KazAXRKqQq2cptEeJgIbyiq8TPz3ME
         vbBdNFU6F2iDmgFOnU80iabDWkvgHSDpEdXeYoRhoAWY85diNBsZIYITv4ew7/jPIgPz
         IS4w==
X-Forwarded-Encrypted: i=1; AHgh+RoCFF+O8TDMfkeR90Tt/WsDeuXo+vVrLA4+RIlOxCF2IpeODNIfKyu0y7vYDmx2A31U0RPfsrxHFvVN7grarQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5TNz0EeFh0Dg307q9GhzKUaPTZCV8b654YkDJuSnRNKCYLvMZ
	L+s+wGcUt+xTMQsjleOLwnh1ACK+ypo8eqSQw24rAkjXErDcgIgDbcVxoXKNo903zU85jP9TdG2
	TfNIxyeMvZIK3BbOetcj7oV9K8mMSmqE=
X-Gm-Gg: AR+sD13KKDkK9T95VPCxEMC/oKWuCs0rJzurEtv4ZoJWoT81gMb3Gj+Leh8reof8/oW
	BJ6tnYnvJbqDDzHmKTpvV/Gr4Yla1Rn4s5pBpZwqxnEnMzHJcB4xUDDG6FmmoDS9bZk8eCO+sui
	2eYcUozN2eBqbTxVMohFfC+WzBa3GzJjPrgdBcTJtG5iLg84xY/Crrl8/1AoaXtvFkD+TbZi4s5
	xKoDGsuXOT2iwsF1k/PxwfGgYfFK3edGgyvC+u3puskOntJDSujGgq0THscI/BvGPbpje1E247X
	Sm7dZqGsSV4GZW0NLCLw3N2KjWWvYP7SoWieV9uU4nd09y4ynmsWfu2fp8dMu3rSzHJap/5/Jy1
	+u60SKdPkJ89FWYPyceDjLwp9kbOy9ItsuTHLqfoM/CnaI3wRjhKehAXNp+6a
X-Received: by 2002:a17:90b:4cc7:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-392ec593f89mr746502a91.2.1786428635806; Mon, 10 Aug 2026
 23:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808032143.2767112-1-mkchauras@gmail.com> <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>
 <anq6-zI1NItuRMLR@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <anq6-zI1NItuRMLR@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 08:10:22 +0200
X-Gm-Features: AUfX_mzliVXpTCoghQSgv41GlVE6gwtmdhR7ZphJ8N6AoZMuGGd6usHp4DmE7TE
Message-ID: <CANiq72mOrQawALW6f4hiNvXX3T6ifg8evtFnfeCjLH_-BGYwig@mail.gmail.com>
Subject: Re: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, wedsonaf@gmail.com, 
	mattgilbride@google.com, boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:04=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure, i'll fix this and send out a new revision.

Ah, that would be helpful, thanks! I was going to tweak it on apply on
my side, but yeah, a new version is even easier.

Cheers,
Miguel
