Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A9C231C91
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611526; cv=pass; b=RZhkC33lpgHrc+dTL6INtMTB0Y9hJZCbzsY/LSlRcIidjM3OjLUEg8jn0l4f5Ts2Jym1DL0MSC6vklZSr3RmSuHaM2mS8DvzvFGGg6FRBm2ftlqDjoh0TCcQLXl0QyG5RY8Rba+cSwZB9G1vltwKzao9kmQlE+0ntOpPYILdwUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611526; c=relaxed/simple;
	bh=tk8yQdZjuBC3I1uBFAy6ZFZv/4okNpnK+GN25/tKu28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/QQGt7xMO85e4rUMt4P9/TclICruj3gRyjpoQcliz6NE+JmdAXALcLzneMfPafdcKk5+U5iAKcpDwoFQldZ2GzrBEGqLwVIwuaeztoYqGcsrD+QYm2yg5DZgDZ+dtNsNLY17ZBXNpmcjmLu2LOIl6p7EQXsmPen4OWqnryCa4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBpegaLo; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBpegaLo"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a946a340so69408c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769611525; cv=none;
        d=google.com; s=arc-20240605;
        b=X0vV35oLyurfLjbELh+vTWGij2pm4yiaQkv3yGrVGdz75GHswqvXYMnaLdKl0ssbz/
         7u//7WkSWsZtQSEEsNbCw49HK1vlZIzognckCIrSytPjfmhT83LskMijQ4tnasNquD0Y
         36WOQLuXTHNcwxPxQx8/54xgFNqBSCJzhMi+uM7LMPIpL9IV6K+d2GA0MvxP5QAsNNoJ
         0GimKvZa2GWYKHUQFe5S/yUYuwHwiR8KJLZbwDLt7rVIgypkR7lMjafJnFSzJrQ8qkFg
         55D7vxKLBazEYwKO+QU7kmcD00lA9O632rBKkYT0FCA/5ZhissE6KX4NgSrYPYZU0CPJ
         l6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tk8yQdZjuBC3I1uBFAy6ZFZv/4okNpnK+GN25/tKu28=;
        fh=xgXk4Vv8VF+lrcELCjYJ7kIVrv9TLCcS2ykIoxmvNcM=;
        b=ifnto/Xej7PCm5J0Iq/lggTvi6GfTYyiAPlR/alS0HL2dN5O4rIicMsyDfMW5KxjzM
         KZy8mLYWKcLW87Ma9UnByXisS8rJiZ7CfJXgtxZRBAKptu8fJGkVNMuKcmnHBCNILtwP
         VGTmoAXKI17WCbOFJJeaVvM0rvbbbpcmX4IwjB7rQS/2V83fZiXbwnqoshCE1tvtxatm
         Mdz4rp1nZZfKxNiNUP0evK0qSwoPMLnlTP48DEvl/TFOysi88QjXx4B+SKgh5fTXbwTA
         IWwlQgp2SN1joYh52DS7LTIgrTiQvRI02y79dbgAceu9fsY6UXTm9M4Zk4r2xkn/UYXt
         LM4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769611525; x=1770216325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk8yQdZjuBC3I1uBFAy6ZFZv/4okNpnK+GN25/tKu28=;
        b=ZBpegaLoxWqA1WZn8FUyaoaB0Rc9iPQXI+K7lMuSOjJiWyfblc7l2mS1VmKGIHEa06
         h8pZ/E0SUgpaQGaa56EJckobi9RBbZYEsW1qHN6WqfqGfXkv/bCqoddsg5jAoU7860fL
         718RY7zybHiscEi3RkHgFJknlM5yd1AYPKW6VGl42D/SolfJhaFlRG/kN0c95yc6cIoK
         dnmyDEBICH3Fig2gsZhmZx0o/+sc/6URWJdKNNYB2vDsRB9h407rHZuaf/mGw8lOO1uG
         ciUHhMpp4n0rwwLfrItRYXiIa22FJtHWF2NJqsE3Cbas8KaZnqUDU86EzmQymX1cIBFm
         SRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611525; x=1770216325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tk8yQdZjuBC3I1uBFAy6ZFZv/4okNpnK+GN25/tKu28=;
        b=TOJYB6gRATF5C0O/YLK23GPNaG8m0VB8a3HXYhZoaFDjPVAYygUnElnIA1rXdn5KDD
         Vk4sCJNoAsqzDhdlKI2pMra/8GpaATEJDXcMBPagBW1cZDA5+OEfHuvXE80DglpMZ0Zh
         jt2pNXh/6Lxd5ZblSNrHOI8qoN4+IHMbCcwC+1wfKTVlGZ75GaK5ufksH/LATQLdZAVm
         dlkq+n02yzehcMcMono8adFwkulS4v9tCs0e2GHJayYvAhY25OmJoTMMOWcZjYCv8CNn
         g1DKVYG8hTecuNsEKvmVZAI9qYjXTgmOXsbqrRqOclNCCbgQJ097FtJaaulaKn29GLIS
         RwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQQdCbTOmq+rO98JHAEzMnYBDuZyQMsjotyc4CIYkdMvVNegfy6dwQBBFJNcHqK6F8HwAJ/8frfYC/cbtfog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEFtEbtYe03flu8W88bLal6+wiAC7sr1jwEMDC3Pj5tzIkPjo
	eNqfyMGqy40IS3BrwPx12ULOnSbgBsQisHtGbbklezwlKPGe3g52flMDAoSL/mvpT8RK4Zjfi/1
	LyenxFgjQd/WEMRb3wJgLcZKGKwzHtQA=
X-Gm-Gg: AZuq6aL4W0PiQkNh2VIy+Tjr4VIT8GJffio7552jM8vwRSgukfaYjqnb+HnbUEgTlOh
	Teyt9LnGsAyU11hBaj6qBCH1bImeZ6HZS/VSJPpTqYX/w29dd0mz9nR0jDWhPalDP0Tpxao9VR+
	1yPp0Rx61CROUj7yE87qA1iUFHAL7xvskEsdPHUJr2HLcJzyy1WTz5Xkx8vRr0GqBhnl4WL42/b
	DsIcpOeFdRN7NfW/PD+aoHl8s1Fcq1C06htPBRRcrkgOjff5lycvnV0MdD60m1GPiGDTNAHLcDN
	PNtei0oYP4jjR1vWVeiFbqa/rAd8xW1qbU1UOu490a5dl1k8nj2UEgSYqKr3LkwclOVo59v/Phj
	ssIfXkJ0a7KuYrKuxAF+Pa74=
X-Received: by 2002:a05:7301:615:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b7af0ee973mr77206eec.3.1769611524526; Wed, 28 Jan 2026
 06:45:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com> <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
In-Reply-To: <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 15:45:12 +0100
X-Gm-Features: AZwV_QiPlA_LKaEwUCgWBkHFyTCN3Tbje6sqbaG2_VlwjwPVORAZwtwQdP-hM9Q
Message-ID: <CANiq72=LyWx+5FbZ8H2FzoXNF9TaYAf06qA-Fo83pCxP_e-94Q@mail.gmail.com>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment of values
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 3:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Unfortunately `repr(align())` does not accept expression or macro invocat=
ions.
> It's still possible with code-generation, but it'll be more tricky.
>
> On all archs that we do support today, I think the value is always 64. Ho=
wever
> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new arc=
hs gets
> addded where this isn't true.

The docs need to also avoid mentioning 64 themselves; otherwise,
someone may use this and rely on it being 64, i.e. not just cache
aligned, but actually 64.

If Andreas really wants a fixed 64 one, then perhaps we want several
types like `Aligned64` etc.

Cheers,
Miguel
