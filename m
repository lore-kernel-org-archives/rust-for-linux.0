Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FE65B5D0
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706527663; cv=none; b=R0fGJYL4+c05sMcmBeoiKZAilUyRnYFKgq4ovzijrZSeEdxV9f6P6Km54l3YXZvoa+TAIauVMHx1CNWLw1ddY7JYovDerQVgbIwTG39VmZ4HA0vSeTXMipOUWOjpSdC4Jm1WGpYIviJG2n9a2husSNsppx7f+RVvN+gBSZygRsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706527663; c=relaxed/simple;
	bh=k7l6V0fn8yxCXNO8wSu/3PvDrI7IlisnLe6L3bhVYdA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SXd4raJj6tNDTYgHpVBklzfjmCAy0E4Y1LWOOMvVa3egGsQOGZ9jp011d5aMV0CCzpqzLh6hsttorouoxHCt6+T1/S7R6sWDW3v8WrljOfj+HQhGtX4Fgr7x9LtWj8Npi9dASx6m5NLdRyFzlHd2eF5d6TusO/g/GUh8a4Gn6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Hp/V2hQ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Hp/V2hQ"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc2629d180fso5569688276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 03:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706527661; x=1707132461; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BK9oWRKFvLpaayJVVc654poik+yv/nlJgfKwzIJ22lA=;
        b=4Hp/V2hQ7F7bJqBmjyOj+FNTUkS5/3f7+PG+W9ovPNPkFryrPc7UcV8uZwgEwnENLM
         E6owdIYNuFpEek/bWuOMTHz6+Vh2RmS8MplkkIjsaK5dujYLR49jjrBg2cTU78Hhk730
         xjnmi7rOjJnNTolFfqmUAPage3JjGrcgLe1HZGyXg0fvev582qbbyDr+P2iheu3ajJzm
         ppmmBiXu74v1uo0b5Vw1HpfBxEz65fxPZR1MoygYnujfZkgMukeaizYH6ZHIzl4bgEt5
         VVVzP3sHER+UE+UkTIlra4YCK9z1aahkwDmHPsgNm+phIxcTYDJVXqESBEtuhc/HHyka
         21bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706527661; x=1707132461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BK9oWRKFvLpaayJVVc654poik+yv/nlJgfKwzIJ22lA=;
        b=kUuTKuey4JPNkDAUyZ/FKNV/K2SoMwiY9qnPgVKAQs3PzFz/5FJ9J2gk3NaEn0vxTT
         JiLEFkboBwaALdwwonwAtul0ifKSI5g/0HG6dkRQFRWr5m7o1uwlpy/2Paph9ashYvKu
         8dXlybZNUuvDwzYMv7AwJisesSflrnszehUCbN0c7ZOth1awD4CjrWx871NdTljdH4hq
         lM/O2DmRzNPJOL9wAOHkJm8fRlRoZYWA4nfT0rV2YN4rk2nyJtmsTwiEAzLtNgOI8g3a
         zF/QuEUwYZv9qFajUhLJSnmctV7RtdPcJFbPiER/rRPVi5xlGDm/JC1VcFK3V3F474rh
         d/DA==
X-Gm-Message-State: AOJu0YzVN5D+/euuIVFdBdfaLy1b2pFCRWMz+7rc1dtkyrWBUiy/quPc
	GEHHrqAF5+MT1Up6YWaLX8i6V6+6D5l68QnsG2hQZewG5lrbgt29i7eijhGh+mZr4SkfEWF/X7B
	uwz9qwLbmA5jV4Q==
X-Google-Smtp-Source: AGHT+IGY6bOcoykcu1DV4CgsUfkRkiycIeubmtQ7N7SW5OacduNhUwvg8i/jiFESno1uEZvN+zxgcb16fTm7kPw=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:2313:b0:dc2:466a:23c4 with SMTP
 id do19-20020a056902231300b00dc2466a23c4mr2038192ybb.4.1706527661158; Mon, 29
 Jan 2024 03:27:41 -0800 (PST)
Date: Mon, 29 Jan 2024 11:27:32 +0000
In-Reply-To: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129112732.645823-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 1/2] docs: rust: Move testing to a separate page
From: Alice Ryhl <aliceryhl@google.com>
To: dirk.behme@de.bosch.com
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

> To be able to add more testing documentation move the testing
> section to it's own page.
> 
> No change on the documentation itself.
> 
> Suggested-by: Trevor Gross <tmgross@umich.edu>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
