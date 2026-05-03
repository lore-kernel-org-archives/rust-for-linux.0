Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA433A1E67
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 06:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777788066; cv=pass; b=Rp/oxNcB1Lv9lFfGvxw3Z6UBkF2g6bAIdkdRceMVneaKlfa2pIMRPmCW2AUSEqxB3DO9zQnoWSEYwtJagIFp7+FYo3twKALoxYsaZa9Ojr/AFUwr9YZ/YaRcosXt0vl5Pp83zSvPQA41cCOTPuSWa/Fj5M5NpkTaTry3Wf7pdao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777788066; c=relaxed/simple;
	bh=wCfwMR9ECj9hefOAeQDZqg7OdsjiS2RBtQZxyfoYZM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gd15u7ZeaSZvpySVtUDXCrFeBawU9tLBFRpgRcw873PwyZI0jAu3Q2Bef6z+zEtWEg++09ehayzlJ+4pSTBk+LoNx4uXoA6intcq7djw6VRpT9Tr9wl5+LEt4mvIBofh5YNg0BPByi4c2KZUdFmvuxYw2LHvdPE176zykqBHfjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/3DsIfx; arc=pass smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/3DsIfx"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-506a747448dso21293311cf.0
        for <rust-for-linux@vger.kernel.org>; Sat, 02 May 2026 23:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777788064; cv=none;
        d=google.com; s=arc-20240605;
        b=KuSuiEz0mKUfEUNRRyMA5XQghdrgZ1wriE75dmf6lqOZN4w4r7mcRJWlDJ3jenhnND
         VOEc+FvXqlHlumaabBxfNtu43KnMErjPK/02IQr2O7WTFTMhVldcRJGP0Cu7Dgpvfpst
         vWaro9zG5WxmMW4ifcLSiof5HQUV+sNGeGGxMxiJra+GDRT7Cgcg7xaOOu9wMMvqePvs
         VMx0W0sglH15im07KwM198ONMm670FipC/LmU07+yJba5/0ihFyneVKZ4fve2YGX/Zmp
         WnZJ9WZs7XpU72eSXeWmFSkbzDjyKl4ObsU3H4x+GaYKl73SjHOeluXJM2Y8rLE9w5/q
         K3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X9ULHTRkNyp7KStodIgdtfu2PjfPsaT5zkV+m42qZQw=;
        fh=a3BJJfsi+ypUI9eUOPmIlt3metGdbOuVzDPwsnL95DE=;
        b=Cme7Xgkfc/Zuhk2bGo+2bQALrjTP/KejgT3PhhysYuywv88u7wf5ARdXrVRegNL7OU
         S270Wa8fOSpNLwCnxvtCPXT71CBL+qJz8gELfJdPgYNq7ZhuoENjCsk8Pl0bcxsz6Vq9
         BOoupIoYxqLT+oIFpD+EUK3Ro7pjjseH5/Ea3smUOKsKiGvePomDbHXWcRV0bjnIe5L6
         R7lNArDvc8GWnwcKQ2U4V50wkJERHWwe4KHDy6GmxO0GdeGT4bWlj3drzT8Dz1o7BvKT
         URpNpU9c3xr3VgKJuXYBQSpPdRpYEDf+SJ9cSfCoAxo3iklmGBwKXrJEY3FQFtXIOgN5
         5QMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777788064; x=1778392864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9ULHTRkNyp7KStodIgdtfu2PjfPsaT5zkV+m42qZQw=;
        b=k/3DsIfx0DaTYgMKQaSS/5GQ3AU3dIybvTV0+1T0l0wlv6aTQc5tZ9dx6QdzO9g1cU
         w8SX60PLp28apvhZK06HOEs/H65j73RZ/Z6jG0J0XejDWb4fjK7dJpMkL8UdfdAXHJkn
         +ArLpjxlRsnHdsRDNCnLb2k4TPhZnyerLAmRuMlb/FSeS0/84vki1xmVu93Avz+kaWXD
         ArxMuBw0p0I8SafnqDskAqla3GnlHewVWj+axIr0HL/rgJZTgq4aT1cfRRb1OAgHeEXm
         8izpG1RTNuw7OjBdarP89OUFeBrl7pwd0tyQDgZWgwjuGF5SsewBFxb4L+nvsqsmDDAs
         NqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777788064; x=1778392864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9ULHTRkNyp7KStodIgdtfu2PjfPsaT5zkV+m42qZQw=;
        b=LIICfiEjvWtUdbL3EYXUVqlF+b8HIVFhhj8Z/eXjuwMo/VXuKrUb+TCOs3WW6KGQv0
         WHtwsrctmb2N6AKEjl1bTja1DqYbFtaAc7IQ4CS6HC06c8XodXqxCClZQWP+8HpyYwcE
         4tVUzpUmprGThaJz2uiQLblwYRVKpwvdP+iFS8RPrrXBII53CDM4EA/h7Hf3j/09xO0O
         ycIHhiTsh4g8xDp0WLbszbJ2LsOqL7pbFck41mM4mZIKfSbOF5Hj3TEmpxzLH2qOulZR
         L7bg2Ovto/3V1PV/DpwfmbsD63whdVPwEae9pRbiHsQ54TOYBrFr/IqRb83Ur0vXvzHo
         /QhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RWMc99YAlMMu1sPw6D96sm3KVl0a2i0LXN8IT8xfYJM7PZvEt8dyVltakx4ptD17kj2VZ5SW1pEM34xh2TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6xqlOs5fMWwg+yUXLUoozStrJ7QWGp63Vh9pt6C6MrmGi+0B
	lDhZDeMRuQ2GMZcDIfUQHHWmDZ4CTL+qf1+16hwbqht9zibZNCza6FZDFlYJqA87FzEjB/Bvd29
	gxuodHelWmg7v6tnXSWc2CEXS5mlSX+o=
X-Gm-Gg: AeBDiesdCOoBF4uXuQvpZ9hQYd82BY5vQyq9nDzGjlIuJiCKLuRks09U+8wOqsO1s1k
	s5fVUtERAoj7xzu8JSWk6odYaviGUb3Onl2ZpC9imCkSqY8nRLQVQeHbh7t5ufbjKLFQ6+N8tYs
	8/DWrZ7iepUH5n8//J2tCTN1RTyFAQlp2u1E4x2xYqeV/Ah7BUFM0w58oEY9Gq/wP6vfnKKelu0
	a++Nb2a8PqyB+Jy1blvTxBn7Fo/c1gKe03fURP7w/g1USI8uzg2U4G/C+R85QbNbdFFFQHpABfD
	6cUOofdmwAX11lWS+EyLrNNdnd52aOkLEP9aKWP/WoTgJ2jayqrw6tS4ARSK3N2CKeSVpockysM
	Mfr7/
X-Received: by 2002:a05:622a:587:b0:50d:8b23:4948 with SMTP id
 d75a77b69052e-5104bf71ec5mr80525351cf.46.1777788063794; Sat, 02 May 2026
 23:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503030801.14080-1-enelsonmoore@gmail.com> <2026050340-kilogram-prissy-a833@gregkh>
In-Reply-To: <2026050340-kilogram-prissy-a833@gregkh>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 2 May 2026 23:00:53 -0700
X-Gm-Features: AVHnY4Lgk75zXObx5AKxwFVNfKeHDu-2UsHM6uymzVhpbBAn4tV8BBUVB7TAHRk
Message-ID: <CADkSEUgPtjkKC684O3qB=koKDPwJoUj-qU_4Z_18NAU_+bBqkw@mail.gmail.com>
Subject: Re: [PATCH v2] tty: synclink_gt: remove broken driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-serial@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Haren Myneni <haren@linux.ibm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Qingfang Deng <qingfang.deng@linux.dev>, Julian Braha <julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Greg,

On Sat, May 2, 2026 at 10:44=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Then that means someone uses it somewhere.  Don't generate bindings for
> something that will break because it is no longer in the tree :(
That project generates bindings for every UAPI header automatically,
but has a hardcoded lost of them, so its presence there doesn't mean
anyone is using it.

> If no one does use it, then please get that project to fix their code so
> that we don't break their build.
They have had to remove headers from their list that got removed from
the kernel before. I will send them a pull request to remove this
header and then resend this patch with the UAPI header removal
restored. Does that sound good to you?

Ethan
