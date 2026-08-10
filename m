Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED95287510
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354485; cv=none; b=tbudTGqy2d9wtI1CZDLQQ98/Uo2RgwUO76+1QyQASe33tMawxVU5nFwdvrkh+wKETWoRO3vpL8dNAqGN0RBs63ajzLvXM9SYyYobAtNTHTubfyyjQMucwb679Zj4rX6jyADoqjvrGsi/vWw/P45SczVFxvVnaeJGkUEzeKwC2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354485; c=relaxed/simple;
	bh=awP4b9S1E1PqyGMivotHigr6bnAC9/fie3tWqis2a+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0KZxCUwcqoPqbaeKnTFMH+oc6qr07JmP69IKhBP3B+c71XPqlDWeUpSjyzxgp9plJbYndU/lMM2TUcM9LEn+f7vbcIBeuWDz1Sh6gVLmkyJEyToi2tXU7RV+A1ZSu/Y4nPXUWKPNmg+5jYkwxZQyBeqngRsAmvKAkumMyQOMw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBbyLhak; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBbyLhak"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca957432c7fso1567371a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354484; x=1786959284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vXJ2H37mHP6+/EYVHjsGlB+YpAJCKJOxj9JZ7HGOhQ=;
        b=NBbyLhakJJ7dB/3SLpESmllv/o8j7b8T9824zXD1Bxo3+eC4sTjnXHdqJ5AoL7iYyx
         QirM4a8xSQw69u1N2goP4HA5wnu/eVoShdNHhCbl2jN0+owhkDDD7HCgzokzDbcvNBT3
         3lGe537FGTu6JHNN0XDNrWECdelZZPPlxuM/LEEsQ1JFoyFu2zd/W4vrMG2zenmQkc6n
         uumz2+lKnQd7ze/4h7wtWoX+Kg83s28m6MuyLQgAlXbL8VAL2AcDVSIrNlgK+IfYcW7l
         in5rgkpVtfbP3sgalpK1Rad7skTb3FslEDoXQb4TJftM5o8F9b7g5qXBlt5EM9Z31Bq6
         g0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354484; x=1786959284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vXJ2H37mHP6+/EYVHjsGlB+YpAJCKJOxj9JZ7HGOhQ=;
        b=qQ3lTqUFIx53lTk/rMpPxPdMkUuqTI0O6xkO9HIchgjYKmDN9AaYsH5+YgsSyzbKeB
         yYIG12KnAbOnIl8wpAmue/xv+hsCQjwQnCpgWA6iG21RBPYDDzgMbC32vah/Y6ztqbbQ
         B3yLNRifVbTjSzLyJNqHsaitUJA9UylMyl+Ztdy+1PXg294tLecEGT2oBoxqhV03bQ+G
         SYRb3oARemIB5iAX1ix2ELNZ77FY6LjCVAjpObqph9uD3Jo/z2EOhRtuIDfq2Ax1EOV7
         lnSOuZntVWS2hnmRZnb1auN976uCbsthZ8I9IiEJGFILrnmY1YFhqkepUZJdk9roh061
         mQ7Q==
X-Gm-Message-State: AOJu0YxDUB7eaLATBlWjtMmHDxbiJNEmGug/SNZduY1ndgpEJHfxVmCm
	LjW6WSlseRYdgTOXrtKZVwaYcOw3l6Nyu+1obDR5x7VKeRM307KPLPot
X-Gm-Gg: AR+sD10LzSEH0Wok2xXZwWlHD478z1YTKGLt9Q8xCkcwaV9jkWc1VFRCwDrkrfhFlE1
	erpTl0HwhYLhGkzTIHSWXzch6PzWAHLQ+7O/2A/FnAN/vZvHq/rb/2gm2nSuqEoSFKVrNO58/E/
	nAFOMtRbbq+sN7pCPZjk286/pRoVnecT/FXWCV1c0BIpt3iz/4VRDGYW+AlozS81AyCBXlrlS47
	T6Lpb6Q3mgkpjKzR01m6mSkQD+XHWZWSVB7q0kRkRGTPX/JISaur/YqvktllEdywWdVSaL0x56n
	7HhbQAAzBYsN+tiPdLl18QDvTm3gIdUNbhUCv3U/rn0GzizrhQVxpq8Or22qNtNq6NJtJPkzO1C
	JAnNzvAhL2PKzATe1iBzK8JhDRl6QZoOlTVdJYNVys/9AaEEYYChOvrtNA70BhWKV0O+Hrj4Sb7
	KXs3kDyGq9pe/RqwDe1iQqOVn2dtxctkEAyAdY00J/rVi2Fhl/mYuijn0Z
X-Received: by 2002:a05:6a00:4b43:b0:845:e2da:91a3 with SMTP id d2e1a72fcca58-84f2e0276ddmr43520865b3a.30.1786354483824;
        Mon, 10 Aug 2026 02:34:43 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100:1e0::10a9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm3814525a12.4.2026.08.10.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:34:43 -0700 (PDT)
From: Alvin Sun <sk.alvin.x@gmail.com>
X-Google-Original-From: Alvin Sun <alvin.sun@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove redundant imports
Date: Mon, 10 Aug 2026 17:34:38 +0800
Message-ID: <20260810093438.208557-1-alvin.sun@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel and Andreas,

I would like to follow up on the remaining patches from the "rust: use
vertical import style and remove redundant imports" series:

  rust: block: mq: use vertical import style
  rust: block: mq: remove redundant imports and format
  rust: block: rnull: use vertical import style
  rust: doctest: use vertical import style

As far as I can tell, these have not been merged yet. Andreas already
acked the block parts [1][2][3] and David Gow acked the doctest change
[4]. Is there anything else needed from my side before they can be
picked up, such as a rebase onto a newer base?

[1] https://lore.kernel.org/rust-for-linux/87v7bgf8f3.fsf@t14s.mail-host-address-is-not-set/
[2] https://lore.kernel.org/rust-for-linux/87se6kf8af.fsf@t14s.mail-host-address-is-not-set/
[3] https://lore.kernel.org/rust-for-linux/87pl1of7ve.fsf@t14s.mail-host-address-is-not-set/
[4] https://lore.kernel.org/rust-for-linux/5748f9ca-e684-42a0-9297-e587b178a47c@davidgow.net/

Thanks,

Alvin
