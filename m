Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE55189BB6
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159932; cv=pass; b=TiGw3HAg7xBV3dcMnwcs3EnONezvUnNaUOWW4GXdnhm5olAwaB4nqvP+z0+YIUuuq6rY8pEgxoPR+4cG3tEDf5MulMx7Eg5QzUzSUeR8TYyPQ5RNJiwYQgdihgpVTkEhJ79TBK+rsZmAwDThTka+PFVHpHVFnA0aJuZq9qwMpDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159932; c=relaxed/simple;
	bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvlbAuG76y7v6R/lBq3x0pE0BlJw4HgJj8j+Z9myfS55Ah5rQm8ztP+xre4d7zXJVaxtqDFBRob/zmXtoEaQYzi33dRyhXAf0tdZq5rvZt9vaEYQ+5/+DmYzBhIP2AtoZ2hMYXgoIDYTQBFEbizCHw1Y9649aMhM9K+q9tHgwr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQBIw4fQ; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQBIw4fQ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d9b27e4aa3so46194eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 02:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776159931; cv=none;
        d=google.com; s=arc-20240605;
        b=MzeDsIUoMnh83VDL+dNsBfPy8v0GZ8iMMWL7uEQN09I9/bK4gYAf57A5WDqHqZK/d7
         gxtzP2imCppeYLVQFMT5NWyqmxyuFjq6af8sy2GpvO/Sxq/uvXSDPhIsfQVGxvTKTnLg
         cgqVPR038JK6fzbZeS0bzfZtdahQv/+rEQuG0t3SLygUS9r5FDRsnJnWCtJMh8tBE09v
         wgTSEY/56UYFiiUwtvpqRJ/fwKivddrMMCbDDk9snziR7nXQFauoQShEYaiV5EouO9my
         iJXeHcxmcqDesj2zV5Uz06cr142kL/f89X9/MwaL3kvIHOwprAyi2rYWWjUKgy84FZNT
         B2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
        fh=q0Kbhv6ESKL/nQ0GkTVTfVzg6IgZ9oXU8LYKgq+5uDI=;
        b=Xe8IhOjA935aOSIPvE7jge9AuI9LUWtzJLOciBjTcdv398oAZxhjFTYpjcDkS7SP97
         iElXnuvlYGhkp8eFWSNGejwtlKM3IwdmSmfqkg6Ag9gdCOPH5qFbPZQIG3pIwxCkdnEe
         RtXYrW/rL0xuqkfF+gvQNkievPj77eZLw1CowSKXjGMJB7XrmPCappK3unofCLP3mvpP
         we4wcvCw+mtfnMI+37n9smUHZzU/MDrirj51oo8egSZ7kSQD+h2ILJqreVUCp8J5ILZH
         ngMw+93kWpriUqMz0x+3PhisY3XYNNj3OFJdwT08heMw6l/to+ROkTVFrM6/nCZ3SKDG
         W7mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159931; x=1776764731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
        b=kQBIw4fQhTEcjzy7MeKYmEsFHNXOR6jccqheRJt2namQ+ZySsjCxNbJWUmpgNW+pNN
         PNyFTf3xvplNfPQZ56EI8h3DlzUB1y2UCxfyparamF3ZoXCNIGrFDIr5JM0VlE4dwvQh
         XP33vS7R7IGAQ0g1u6q7lLamvicu8P6swEHsu+BDEDg0akUPNnhIz09Vgm0bulbJhiY4
         b73HXps/sxINs4jka6bGajKhPJ7C0437iBjPhZokniGQrRotT88zJgHPXXa+dbKjPcAB
         7T20tP2L2662GvhrAFgToll3Qsc04Z8Yp1wjXJ1vfP7TMJqgYa5rjeufycxKf9ge8LsP
         O4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159931; x=1776764731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
        b=sI/JismGRFqXJu1m2CSG3mzGNYPAO8v+ZvLsO3O1jhHmXojGHEAyDWj8i23xRZAPa8
         Y3bhsIkmSjmMPUJ2PNSDooaT0DPNghpprGbpzBp9Y2amLxc8aXR2+X70bdvCVmCmSqpx
         HqmD8cLHIef3ZWbwh7ipPy8iJWRYvME9Ol1clOlt5AsuD2uHs/eKl2GSxw29p2HcKbC2
         WlZbdZgCAQ/G9BbEsGsD1r5cdYYjDHjwvZRdAjqIuBX+fJHzEC1Vq11VwQM/3ymb35PI
         YIz72s5BGKwYbQsazp1IvWVYRe7qDINsixnOTghUDXyyHm39hY02pGhUGrtt29gtQigX
         wtEA==
X-Forwarded-Encrypted: i=1; AFNElJ+ajwhyIF4ME0HyTpaWo8xd85U1nMs4m64I42g688gveZgFP+Ti+ia2qf1bFmp5MhdVY/dwSp4UmFwtisQrbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHyU82+plxjVV9gxcEmimgonZVAXhtEzQ6fPI5YsVK+o97PpO
	Na9G62Jjlo3maECOl7CaIqdA/Z7mTKJ4Wc3yB9Unwrz2+r85aZJFvAP53m5Fiel9wX9LYZQj9Ah
	vTy/7FapKUgs52R8oTIMA2Mlp+lddWsY=
X-Gm-Gg: AeBDiestd3bSB/249FpT7veA2t5OA+3Y5Qn6YxzbmwGHBllvMLkEXqBXzY06kYVZOkN
	C7xrEJRPQrf42xazV+AHoWwMAkFYfjfi4hCTdVQOjecAOPvFpuVwRYuRKPmifWAe7km42H3DIkB
	Ve1sa3U5o6MhZLVvgoa/Lerky09HsbO7SaU4ieVayJM8YTwCuxTgSWrbTdwWgIX5z19sDYCzTSk
	C/J/mn/RgmkT27mhBf1wjLi2TNLKePYNsXwfgU6EHpbKd1gil0PfBaFx74s5jqPTvmjKCHStRlP
	BVM90DNP2nZn+/HnG0AUIBRZ8AljjSe7ls9amoTKnFNUf/nbSazTRT3plfjl5TkZq5OWAIpbc99
	Faf7tyhKmR9gn8k5CaAbT3hQ=
X-Received: by 2002:a05:7300:6da6:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2d589ca7743mr3954484eec.5.1776159930459; Tue, 14 Apr 2026
 02:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com> <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com> <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com> <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
 <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com> <CANiq72=AtpG=B+VcyWoX+qL_tk-uUtgiLXYJD0epOfnwYfPD7Q@mail.gmail.com>
 <DBTGVEJQOUDM.OTGZ6PXLB9JV@nvidia.com> <DBV2Y6TJGVZZ.1XZG9FEIWYDBU@nvidia.com>
In-Reply-To: <DBV2Y6TJGVZZ.1XZG9FEIWYDBU@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Apr 2026 11:45:17 +0200
X-Gm-Features: AQROBzAvRRNKhjkRJeRP7VaiGqCfBZwB_RcAn6Yu8lYwFycjLDw6KlutGeRCRGA
Message-ID: <CANiq72kV9nN65mf88eq83_1tqOMj2CNz7BsQq4SAafUe_srL9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 7:02=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> I didn't expect that, but it looks like the Rust folks want these
> methods after all:
>
> https://github.com/rust-lang/libs-team/issues/631#issuecomment-3156000663

Indeed -- and now they just got stabilized for Rust 1.97 as
`{highest,lowest}_one`. :)

(They got implemented in Rust 1.91, so we cannot just delete our
versions, but next time we bump the version, we will).

They have also stabilized `isolate_{highest,lowest}_one` for the same relea=
se.

Cheers,
Miguel
