Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355453EC831
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649881; cv=none; b=NbWv8qzEwI7LBIvHhCRi2IUAUsPnBw1argKowuwVeX3G+cotuh9eiyNMac3xE3ZYD839KQ7BC7QlGmv2CNW8HYTo5gYQ9jmS8+kgn8x9BqqafvwidDCydahV90DDDFEoejfpwJbjv7VlIRwG/ajZxFtSOqadSf7DfzkCujW8BcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649881; c=relaxed/simple;
	bh=vHLaGrUi7+Oo9AeiJB1vfZ/JdoschteUbCDtrAmEsM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrljncycTUzarHzY2JuvQyfjjXUqusXeClhlqdUHR9suRqVdn+dPSbWXTTpe9aR5VPquJ0jQxQ+8QelOXxjycJYDpSFqAcli4873pOpQbpmw+n3jpLiQ/az/cqana0CmebKDJecE56cvDLi92hVSC7SEBox98SfRPoUFHGj8Vmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5TG4Jvi; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5TG4Jvi"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a14f6613fdso48706901fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 02:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649878; x=1788254678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHLaGrUi7+Oo9AeiJB1vfZ/JdoschteUbCDtrAmEsM0=;
        b=k5TG4JviQQ55pkoaosdSYsVMx1d+g2PUs22GxFGPlV16cP4TM8l57ik/cZIi3AhHuR
         wNrOwPbSezPYZVVayOPTauh1bSpNbzrk3zUjBqg15Cn9q1PH7RUIqucPZh+5Hs2Hn4Ut
         bqRSNUkpW1HRGRGJVoaGBHbb3vPef1FWMxFzEXXXztAGx9DJ1CyAMhmuA4kbNg9BuFFY
         zwvBRJc/6DBOux7Bo3MLEAOsiwVdMLKEi7yljZXoB1b/zmO+YxD8zuOZyao8iQmbVgLd
         WTFPDQDtCoavn2lKRQjI39r9ZIDAYYGpIMUy4vNNAoVEhNGgMwU3b10KGjR9TVwuSdD3
         a73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649878; x=1788254678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHLaGrUi7+Oo9AeiJB1vfZ/JdoschteUbCDtrAmEsM0=;
        b=qUmbevbyYCZlADuUuSf0LliA24d4COV1PBOYvD7tjnbU1CsVq4y1Uljzoee/u0qqNu
         Bp2m/pfmRGlsLMkv4yD0yIZom8EPAK3n9mII6C6AZA0Ihw5w/WJHpv1y99CsQuVGHVRT
         CbeOSSyMb7FSyFrg9DgZ0y8bAImEV9rBC1u5qHTEO64xtGDBuh3svC2oczvUOrNzMzkG
         jXeaHB9RlQktyVapHskrOTx16v5NcvrQx3EwS4NgG0OUJJXKVzubwJBe8QMloTYmAWZa
         yL0+ht85ALMimlTCw8ztMdR6lCpILBQm/OW5Imp8aTh6k6bz0cEWjNIOlFdangCsawzj
         z46A==
X-Forwarded-Encrypted: i=1; AHgh+RqbHrUzlYyzJSYuajlLCUVSY2cHv+kehqf0k5w6pSlSZ5nN374wE9rR/rDu340UTKDZpryBe81Gh/XtndVR7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mBthY1KNxiZLLrKuEtjVxqC7oJfvXuUtlXkS6dlRJFFFNeODU+
	qmPlFKjvibVMfYqSg1ujzuc5Z/A8pGJCimzTEOf8KNWG1CWdBrj5kXCf
X-Gm-Gg: AR+sD11KDlSPtQ5L8hGHRCA0aidEb0b22vBBs8/rgCxECiCt1D8ZSZhwb89F8LG0Y1C
	iE2Go7z628Vh/LOq65zQbWHrXdzsoGYiZUbwgqMLoeMClIEfW5rNbo5BSKWCTECQMEAllTQzEu5
	m53ud0Gz4/KOP6klDmPLj/tqCfA9QR0407PiGRvXK3y98xsCyHEnpiUcMoBtTIuFrl9Pa0CWh8z
	bhRaBnWEVAxKxkWSVnTOH+3GE1sHwlqChya1GaoXLJbdTPcHvnBLojYWrLgwFgLGROSmc8NxYUU
	pXKcHvXuqVI1K7/1px5zyK/QjTyR8iVqb+mhJoz7/Ngk/pMHQ2zsHUQ8ni4Y7smuHsdwnctEtdM
	FVpMYRk8VTcDnb36O1zHEKoVpdUm44DKy2X9Q17HBrQJZxia6EYHymu31/CkXx6rhZ414J8QjQM
	VASHRzv2+cV6Rw4VByjUJRPzp9c0XRFVPgQFzUvvEymvfgLC1lYusOHebS3obJOfEr1ZVerdt46
	BxWO+NqsWQkvf61zlCGzwOsbFYV88JcP+wd0E7ttCtakGHCcCTXTyn0Gw==
X-Received: by 2002:a05:651c:43c1:20b0:394:1254:10d2 with SMTP id 38308e7fff4ca-3a1ef07aed5mr7714881fa.0.1787649877837;
        Tue, 25 Aug 2026 02:24:37 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-2.dynamic.spd-mgts.ru. [46.138.191.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2e87dd6sm18732761fa.13.2026.08.25.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:24:37 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jann Horn <jannh@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
Date: Tue, 25 Aug 2026 12:24:25 +0300
Message-ID: <20260825092425.64784-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ao1E_6yo9hE17e2E@google.com>
References: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com> <20260824194808.216021-1-iprintercanon@gmail.com> <aoyvV5-ZqXoRDFaf@gremlin> <ao1E_6yo9hE17e2E@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2026 at 07:32:15AM +0000, Alice Ryhl wrote:
> I'd be happy to let someone else work on it, but it's somewhat
> nontrivial, so perhaps we should have a call to discuss the design to
> work out the details?

A call is hard for me to fit in at the moment, sorry. Could we do it
over mail instead, here or off-list, whichever suits you? I'll write
the design up in the next few days and you reply whenever you get to
it. If your vm_open draft is still around I'd gladly start form it.

Artem
