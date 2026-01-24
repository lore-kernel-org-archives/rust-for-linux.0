Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CACD21CC71
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 23:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769297552; cv=pass; b=mxyV7gENR0abwgrSL+KMVzcz6io0wa98BSlJo9ZNiJ74wqe6GVJu8dCRxrHIuLvRo/Vkx5GLi5xHux2XB68J9VtgX7haKim98yl46PJJj7sdvYB/AFAKTc09PcVPNjOOgheSoax0QgB2z9Olrno8VjQ12g6OSwiPF8adlX2N258=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769297552; c=relaxed/simple;
	bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yo+neGOurrgy6xETQ+1XVECfDLhIu3iePthCLz6oPWdeuBtRwFj449haodxNT9QZ+W4LtXy65d3EOtvd9YsN8ddg9aILkSf0+ZSn5op/ippRs7dqQn53iud/pn7ok40EO/lM0K6MP8oTcOYSx3uersuuKErOpy4eR6tuUA0Dpz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaszhpSV; arc=pass smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaszhpSV"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-5014db8e268so55659881cf.1
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 15:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769297549; cv=none;
        d=google.com; s=arc-20240605;
        b=WZm/w4YotFFK8ZTA58oawF400Bgs3VDDUwvad1YpDBXRSMnBiu1hk3zTFV+h8uG+Lu
         SCowov7IfDMv2yINfy7iWtW/w8WaIgLYUGF90M5j2eDyy88odu9CUx7mreP8Zk5afZsF
         anbxtxwLjbm36w3YmmaztTn03rwh39xVdWLbM4yoAHeqAhLOufv/8bEgpQtIIPT/GZ08
         KAcMJ1Y0eKBcR6Izh0VAmYmLokFYWDjdMcZ9RsRTXQdKeynj58iv+/b5BNrazNV1ZZLs
         2QBY+KJ4JSY49Lc9s43NCluWF3B2gY+BY4i6XPyKvvXjQMhKVXpd+cQvHT7JsyVCMI+I
         qMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
        fh=foQhhahB4+3O59aPakrU/XPyhB80qBxn9k93rqV8k4M=;
        b=e8kTCYyIJiX8s1Ao+TdqrlLkZtMSobcZkV0zJQB3y5kj2TzjOvR/STv/m7oMRbE3Gg
         IqbCx4dF5slqn0/1wXKk+z+LVz9F3hLTa2VSU+F+OdXg7SmyIJ0kiCNWvELSUtSvhkCm
         KV4qBlvuOAbjF78B3QAcb/yTnili+6Izf32GZjBTZh1uHkYCH8lVKxNNsTaBs46hgLk4
         wmGT0Noh22VZ7iQh1uqerwaQrPizU3LQuW52+gLnL/qKwzQkBU3tycMyzadrHG/PGNWG
         zT7nIG09qogIbPIqDG6ybHyEslE7A1f8ZY/BlPFZA5ucoWwdNr6bOAXXAS8x6/7PjrIQ
         IfAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769297549; x=1769902349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
        b=CaszhpSVDhvXzlO7i5v7MZuDpk3LEVYj90HYC5ggSo+i0hWCkXMXeL2ps/7SGClU0a
         oagfcI+67P9PYN50vUA1FDHzyLylIVj//6r7kPr33pdWNZG7OetHNJmVqH+RLue2f4Ti
         RyASq2nBsmRb82ZFGibxAdGiuiuySBj06PDEupDqzEYB0rBAYozg7/aJhtBCt3tt6xzL
         65TaECbGBd8wY8fCaLeVtZ6Vi86EIj8CBo5Wd1ntGwAZjFi+XN1qJ13vy8y6CTYTO0X8
         aN/lXBDHBZVyGzzEWqy6gkKrqikTEWYj1sr6AkDSoEB+QLGF5lPbzUj3fJXyyGRwSGcE
         xU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769297549; x=1769902349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
        b=CQ1vkiXPgnTpm/kaRFARwr1Dt3aZXRcH1CtUE1Yn3VaRNZBNSy75TbJbVoKoWGj8vA
         17DV0FwsJfGSDuQlATVNaO3aR773Z5n+A1Oa6C18TT0GKzu3lq61uyzS72Cy5bvELbxA
         aEaUadlx4lo/SQKLiPKDqH4vqfrFl5Y8yq6bSk03lammvqlR3TDddv7v72l/0Zrf26OE
         xqNCZ3vT6DJSWzK376XMUkthmWkfWPLh//N4ypsCHX77HZ0f+++oK7aU7fSTrQAtxSD4
         q+E2Do8pZH7w+/FlrMMG0vE8KRUVoNxObV0vapieoF21ql27dxnjLVZ/cZyacko9nKHv
         FFrA==
X-Forwarded-Encrypted: i=1; AJvYcCWv2SdQGq0A7Ke5Hu800hmuQzPImQqw1bNxoRqikP+N3gA95o4698+j9WIzBvfEyjDMM6nNbQM+bfRla/jHPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aCEnU6ljGb96dA1xIrsCRJjt52IguL1e2w6LLI/4ee+1gYRJ
	cwcXUHznnTBLVbJlUpjYEwKEpqYY9z3NrWYwvp6VLi2RRMCuz5yQbGHzafViFMrCHb61nji1Isy
	q9BLb08hvUbdyObz//vW3SFPtArl4wjY=
X-Gm-Gg: AZuq6aIDIERfZF0a1EYdBT4rl8LoYvigKirFhkPdHzrZlhDMSGhyJszcsYIg8RFcq44
	hqViALL7RQj6I1gOj3kD9vPN72Rnbp6NOhYzPnJlthUeGTLHGAI63aIbYLeg58IwypObQKyur38
	g0qu3nXZ1Y9zafguwGAc0J9kG+NI3u+XturN/du776idW2q6+lG1cEme4AgQ0nP3Htu7ydIYH6J
	hkOf3AJU2km3RCOZ0HZm4NLlb0fe2a2YYnQcBrIVsFmK/LmVPf9mE/cvwvWdOayPmz1J33TAydL
	Pr5UAibc5Qe53Or8kePmwBVirUdqJeQ0p531JA0Jw6/vXUoA40pSqREAlDEGrkWS6MYcXMxUST0
	XT8XQ/pZ0VPVrub8=
X-Received: by 2002:a05:622a:55:b0:502:6312:8d6 with SMTP id
 d75a77b69052e-50314b7a6e1mr2969171cf.12.1769297549164; Sat, 24 Jan 2026
 15:32:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123033233.16906-1-enelsonmoore@gmail.com>
 <20260123181156.GA84531@bhelgaas> <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
 <8477da83-2441-440c-80f1-66dac9700523@kernel.org>
In-Reply-To: <8477da83-2441-440c-80f1-66dac9700523@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 24 Jan 2026 15:32:17 -0800
X-Gm-Features: AZwV_QgT7HJ5RzGZbmSKdUH5ZCEsN2PptDSPTNTy9vD6bN7Rq-MPZtQjsOmB-V8
Message-ID: <CADkSEUjyXH74izTrsfhdAjh=n-jnGx=tXbqPx86M9OYqjXj0PA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Takashi Iwai <tiwai@suse.de>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 11:25=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Yes and that's exactly the reason why removing unused IDs will be a probl=
em.
>
> Let's take an exemple: some patch adds PCI_DEVICE_ID_ARECA_1682 after
> PCI_DEVICE_ID_ARECA_1681 in pci_ids.h in the mainline. That patch needs
> to be backported and it conflicts with PCI_VENDOR_ID_S2IO which is not
> anymore in the mainline but is still in stable.

Hi, Christophe,

I understand your reasoning now. Thanks for clarifying. In my opinion,
changes to pci_ids.h don't happen often enough for that to be a
problem. Unused IDs have been removed from it before.

Sincerely,
Ethan
