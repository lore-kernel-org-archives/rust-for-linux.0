Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59601DF969
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 23:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479582; cv=none; b=TbfaK9AcpDzNujFF/1/q6hankIr1UC/uxpQbdcTUQEeOfgUaszQu9k/+84Qmeh1oaYlyVq1s150tfGRyxLrR4HphUPfbsqvzCG1ssZRM/HIrOznFP3PO4KGm76NNEJtQYvJ0frCGwb4J7mDrTbEkdFzPLB6tS5+W9QoZGTno0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479582; c=relaxed/simple;
	bh=EkJmFc6CR9j2uvgE47iuIWgx8DbsmlY6+5OXJgtE3wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyPkzP5V4H1aCqgnsUkwcnuw4YKE/e9CxUpW4TQkT48FeywVJUuuzTiOF1bLDXzc6UbzWLsMrZ2M2p1nbNySQleiUKErWEqfNWmgk48YYI4uoyhXttiWib3Zj+926NwKoFRs2XMMWlxZmuSIfynM2VYynxLc2yW5UZ4G+m9cfJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiTgMMUd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiTgMMUd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216513f8104so6327085ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 15:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734479580; x=1735084380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khzqE3t/oBIkmFQVzKV1e2bvtgQpbimTlF/c6UMFETk=;
        b=hiTgMMUdZN0R2itkYhoILwyoVcejf99lKHjQk9lFIz5LG1pQ0H3QKz16Ln3Oc/WXe9
         Ls2QxXcoxKmegKexOn7CLMg45zTiO5QvAit/+QEHc4Wxkd1DawbxybCbcE7QzZLjneTb
         cn+IfdJY3e3mNbjhedUmYGajuG7cN0zD8lTgtygAFZDan6zPGWHbS/HZvcDACNQ6uE6x
         EzAsxwvjkL8Jywk/Ul4gqke5nO5x9PzCJnAjCb+K1odj/P5cdeJ4kFbCCVbmvdWYZJ9w
         lrJRR5Ydsg0mMwN6QJfdZfQITsx8HLj9iQCP69pKeR2KSembFKpa2t2KcRjZKMCcmXer
         w3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734479580; x=1735084380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khzqE3t/oBIkmFQVzKV1e2bvtgQpbimTlF/c6UMFETk=;
        b=hnZ0/IoC/wCEAOizMZ6PkvicxMFQPB5KzfXwORdoMGm2B8rv1UlMaB4bdpWUmq+1+2
         yOcvIsL3js58vGBAZg/3bE+WRRi5jMxxoyt0jkyJ4mtRGhverWDGSUOlcVJgW0TI/jG6
         jzOO3Kc0x6T2ImeZeQxkK5tlwKlaJ1kRo2DYC1bAsoRoHX7LODA+hQNRplKa2PLXWiUI
         juiNc+95mMLGyQN12g6RPRhxjAK/fZyUJnQXvTkVKFOwqoAf6kNy/JkEtvFtyFUfQ3h/
         ft2OT7yLVUzluCEhncue1LPNCnmP45h4dtwezzSN2zkzvbCsgaEGJ9Ye9vWl28tiZBeG
         v1Nw==
X-Gm-Message-State: AOJu0Yy+rPjIhzyVcnwp972jLP2DaDaRGOPprMzEI7Z0vNIlGKjrfd/a
	6rnJ4lgJ3M5dmhG3aItcZ8D3UKUmsWFfKSPgPejcEO5GqZmSaInxLoO5F8V2yoMa5b5X8cL0s99
	wG3juUYK9cTtxbBrBK+otX9lwsYQ=
X-Gm-Gg: ASbGncte5MUt/TmgpG5nbefnWDS4r3I2CSZEWn5SZIJnZr/mkGPE+/bGi5PkPyzm21f
	lm5pOLRihI/2taw2lUnLkcIu+rFAqYm76fyQQ1Q==
X-Google-Smtp-Source: AGHT+IEYHO6gQhkvMtVGP01xO8C2qGTeb7ik2LcrBJNyOBNXFB+eIhxvfgmjiaT4jtG0TyDD8aBqyUJJnO2NezU111E=
X-Received: by 2002:a17:902:e801:b0:215:3862:603a with SMTP id
 d9443c01a7336-218d723e7b1mr3800165ad.10.1734479580225; Tue, 17 Dec 2024
 15:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
In-Reply-To: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 00:52:47 +0100
Message-ID: <CANiq72=kHXzaGtcSV3xFkiw_BsorJovjYaNriDWhvXafeZhDxQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: Enable execution of doctests
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:35=E2=80=AFPM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> Having the Rust doctests enabled these workqueue tests are built but not
> executed as the final callers of the print_*() functions are missing.
> Add them.

Applied to `rust-next` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
