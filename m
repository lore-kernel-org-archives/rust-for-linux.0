Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200103B782
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Feb 2024 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707747748; cv=none; b=Sf+RIfy+w5+UB8yzX2Srxp+0NJck0VCm3kAdREt92wwkbLDl+5/IXxrJXJTB+zrT/GjNCp9HDGMG8dg4VP7S7rGIj25awZquZmyTVjYPqcq4DTKadkjHDtubSyB55ROB9wLn9u3PFnd6xF/1TOGUNBRSClwPyECUWHuIBsgneC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707747748; c=relaxed/simple;
	bh=fPFMCUSQsbybYYsyahcIf+x82OS1p8+vzVVjBWGByI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaM7b7OyahePPKOh6sWC8TeX90YPuyt4ez8WA0/33MZIMtezBlgMy9RzSjbq4D8KaDfuCyDbh1fIVF2NnRlflFsJm00UJ74v1uasc2SDNzuWZxyNlvdafrZGHdg+LrtwnBvZiRM6zFO+itOvUOFC03LnEqSqOfnxjimKoKyd9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QdngOZQo; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QdngOZQo"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7ce3c7566e0so1300392241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Feb 2024 06:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707747746; x=1708352546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3LbdBXEWnAUnj+b+2jhT2ldLpLCcKlNQ2zbvZ1/YpM=;
        b=QdngOZQorjz8pwucczOJ3oVwy/OpsXpfLA6pOGGghemnmaO5emtS8VJOZj+M//PsQE
         lyR1qdftpmuTRU05uqm6GWkWD0GlpyTfTQXSZEXWJzsDlXNgazfwrv6/1yN38CwZwAi1
         lhrngJd5OiX4QCDZObAyGI0/XvcdzqsSvUBRUy/9tveZ+roMsE7dwxdG23mHImiVMsUQ
         k/3aI2gfCH9w1y7UKGmsZrQk5y9hj2wjfl892jQscLeF4Rjh92Kztqfo65lzkUSodKN5
         Exo3jPTgB8/5+0g6WSZRbwTUrYmPTwgxivR/UCzGFZs08K+bPyqYX65+7pEVK6QDxDMY
         Y1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747746; x=1708352546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3LbdBXEWnAUnj+b+2jhT2ldLpLCcKlNQ2zbvZ1/YpM=;
        b=tThAp2mS2W/9Ot7fAB+LaGLXCeZTV6n8eyrfEpkDgpiTPOdY3pV5Nos7p3CwXC8/BY
         MylgKt2WtahtdUo9whQa+gKIWuprmAavPkYGEPbPjQ70z34SQeuwLLr0pWXUpM6suoPS
         VyXMJ8ufUoj4xnDI6YHFz/twGhDWXkS3i/RSOY2XTg3AxelpPazKJ3lcmyfd6TcAIXEL
         c/c9beUWlj/ptKqmL5qcLhH3x5fHclBVXYsch6PpXlDyETTVO0f2Th+FTn6eusmuOM4f
         /YR/LdaEf3s7/nWptQAOB5a4C3c1garTlxOEiNf+ULcbfYeh6rh3UVckHv4FXyu90XYQ
         q0YQ==
X-Gm-Message-State: AOJu0Yxs8sai9kP7xy6gocQpApJlNAlqangxK0E5QCXEtwntcvVyrx0w
	35z1+IxINigE7gTCWh/sqxnNM/3Q+MWMscCFzWrpPFoFCWTmS0f3eVGks3LGFsmONoYO80mhSZS
	SyK7fo5GmRb90/EDt189Un7PUbGaMmPdSueV7
X-Google-Smtp-Source: AGHT+IGcly7MGpGlQ+IX/7WhJbvTN43iKbx6NBGvEk+t+fbdMNeIGEIqTF6T3+x8UPm1Sblqp9i52vyvtYcK3j33zrY=
X-Received: by 2002:a05:6122:4a8b:b0:4c0:7756:547c with SMTP id
 fa11-20020a0561224a8b00b004c07756547cmr1723692vkb.6.1707747745819; Mon, 12
 Feb 2024 06:22:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-rust-locks-get-mut-v2-1-5ccd34c2b70b@gmail.com>
In-Reply-To: <20240212-rust-locks-get-mut-v2-1-5ccd34c2b70b@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Feb 2024 15:22:14 +0100
Message-ID: <CAH5fLghTKpLs=Wb03cjx0LRQbZgmXRoMNy1cyheb7cQRL0mjsw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: locks: Add `get_mut` method to `Lock`
To: mathys35.gasnier@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 3:13=E2=80=AFPM Mathys-Gasnier via B4 Relay
<devnull+mathys35.gasnier.gmail.com@kernel.org> wrote:
> +    /// Gets the data contained in the lock
> +    /// Having a mutable reference to the lock guarantees that no other =
threads have access to the lock.
> +    /// Making it safe to get a mutable reference to the lock content.
> +    pub fn get_mut(&mut self) -> &mut T {
> +        self.data.get_mut()
> +    }

It's impossible to call this method. You can never have a mutable
reference to a Linux mutex because we pin our locks. At most, you can
have a Pin<&mut Self>.

Alice
