Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE612FB09
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706814616; cv=none; b=P4rAl0IWwIiCl9rx2uTisNkAgPpYomp2B0+49a+6AxFmkwi1sUEGsdOftJi8f+WmT6qxGb7qBe7Kq2XCejOpPB4bD1IrZQC5usTChfcWhmbo+bHSHh9SlgZTmFjL4xsT1cG4wPgE1QOTje7s7kdMBFT8ySPuhtPvo4LWtxyyvzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706814616; c=relaxed/simple;
	bh=gKfbHuXg+B4vWm41+gt62k5mU+p7SAq/npc9sj4NN7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWD/W19F73o+odwKbEAfqB9x5W9KoByl4fVEXC4vQd6Q44KVJmo9KkmT/gdql4eEhje4G4NfwQqBgHHMksDNCdxOW+HGqmTeh84vddZm5U2FHK7W/txv5hymyx41o7bxrI4nUsBiJzkXQqzwlTU2gaEDo7016y/xvTiU0Kr6G1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6bKMc1/; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6bKMc1/"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso861756276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Feb 2024 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706814614; x=1707419414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1txb7eb/bMzYmEWATsl4oAOQVHR0jHiFNeF3Xtiifg0=;
        b=g6bKMc1/LnicIXt7AAoRi9jl+EdPlw7x8zGevjMG283HXpsGa2Uh31tPBGO39IY1t1
         diI4AKdr5dETy5mw1mj0tr627XdwywWWKtDf6Lo8RbuFuWLqOkXNF9kBxiGtzAlSt6ks
         UtLKQtg7SLxTFO2lOkp79sZGsV8awm64EzaAEJudW1tpsNlVdiK3xjkRGCCCyXVS1zVv
         PlKLttSnnsJG5UvllTIgz3MnEe8RAq6TdKuWS3sF79aNynQG5deDpsOHWlxBjD2EaTT2
         YD+Shsm472rNx0ZteargR9aD02cZrtk66Le1DTlAGqHBPuUYDWwzCPIb5MV4+2uMWK0x
         L8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706814614; x=1707419414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1txb7eb/bMzYmEWATsl4oAOQVHR0jHiFNeF3Xtiifg0=;
        b=Ok01Yzr3Mydbf6t/z5dtrLV7keg1SCUzjp8cDUhuPUkClTaR3iHgJaYrCrmB+D1kVJ
         TsmTWCxGFq/eiiZEAIFSqMlTjuJkPZIoi+UE/T9jAxHnsmUvV9AQ6lzi8ml6Yi8/2/SH
         YNVJ3Yws/O7JR6+k3TisIIOfA8NToLc/BIFNdNhN1/NNEBnkqKK9FXOPJsrMLRm0hYWC
         dAcWsgJJaiRWnYBwZtwWaNSQO/VlQFjYzDy02ERnfAvATXYqLaTGAvkSvinSD0ypTm7e
         hGmvm2IA/7OB4px4PYRfCw6u6MZ1orP+5mKSjMhpDqV2ES0jcO3WrdxhqcoG3k43NPbI
         TDgg==
X-Forwarded-Encrypted: i=0; AJvYcCWjj55kyvKdPcgk55wu9+QHiViWPolym1VzmIrA8Jbs+SpIvnBU62WTnORp4ga0Wr5aRZKCZdq8+/r537ga2ANh71WzWt53Is4oGcq3RqQ=
X-Gm-Message-State: AOJu0YwjcBmC5eVZ0W0ZckNr7kS7aonGzT0XotqbhR07HPjhQ5OX7z+F
	8Uc3bJAdp+cXHky9zD0aZzK6Creuk0t13Og9D2Vld8+6P2sRcVVerf/98zwm/OR17RALXl97a3Y
	THzZ+5/jZsBpJPXo4PAMd6oEfycCnYBANL0Y1Mg==
X-Google-Smtp-Source: AGHT+IFBBSK+xi45GYY7AxeNoaStWOBjJqTCRCjxG+dl2lEewUHglJErf4NdG6L6IMBPWjoG4+asgzk7Cz87hrOh1qo=
X-Received: by 2002:a25:ab31:0:b0:dc6:de93:7926 with SMTP id
 u46-20020a25ab31000000b00dc6de937926mr1948625ybi.47.1706814614185; Thu, 01
 Feb 2024 11:10:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>
 <ZbvT58zFeGoxIiHM@slm.duckdns.org>
In-Reply-To: <ZbvT58zFeGoxIiHM@slm.duckdns.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Feb 2024 20:10:02 +0100
Message-ID: <CANiq72km+xNnuU9ubhT2ONmMWBu=AwTf3uNtDN0O3DFKnoOWCg@mail.gmail.com>
Subject: Re: linux-next: workqueue + rust build fix
To: Tejun Heo <tj@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 6:24=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> I missed your email. My apologies. Can you please send a signed-off patch=
 so
> that I can apply to wq/for-6.9?

No worries at all -- it is at:

    https://lore.kernel.org/rust-for-linux/20240201190620.18064-1-ojeda@ker=
nel.org/

Thanks!

Cheers,
Miguel
