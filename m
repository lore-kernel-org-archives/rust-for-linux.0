Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A043E122C
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135241; cv=pass; b=ZEZvapXCeFjk2/9PAR872nscI02gaILG8Sjelgym9jWOifILJWFVYF3mBuZh86OTXaDbhPSMRjx/b8t9jSO/MVRzaHg2usK7oJZOpfyA1X9lrhsayZTx1AEUcwY2deH405hi3rseALUtK8Rp7wzg8+iB2JkdmGe7nKypdZQNa/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135241; c=relaxed/simple;
	bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7WMBi2KV0SVBjtAt1goBRN+TkSkXtk14y71nccT/mAoty8xQiBBYjKcXL2pLa9ClfPpDHck9zQqgEv8DBqfk2e5cGlkC+8lqmmp/WS8yeYbxNiSI1PfcwVQZUU2b2iB04B8gEDeM8WcLSz+ySo+lJqL9uMMHXm0a4CA2wpEhXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK2CtnxN; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK2CtnxN"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d75ed779bfso812929a34.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 06:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775135234; cv=none;
        d=google.com; s=arc-20240605;
        b=gCO9tfev9Vcgce5G/cO8OU+RXWzsm1LDyFDe7IZAGPXEsyGcE3N1mWyf4y+9PY9hx0
         Px9JS/55QNufCLAaEwkoQ/VCFqGo1MdGoca/Nn4oROEPL838cRk771A3nZ0ArRH24yoG
         zAZj6xQNz24kOM6EdqbyVQG68JXTKSOlooATu/SGMKlp/2LlsR4uVAdWdmjXnxBOWesi
         xz/z1nho+hEu0NVmcgqQSebPaxccFMZ+gq9/SRbrXWliV/7j57pmxYtzZTcjIm9KdeiY
         oxtInl4eLKXwHUbrqLrOkwOgta96RLHkrx+8m0FOq7IKMXbxq+2Mo8/MZZO9y0y59NGm
         VKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
        fh=G7Ugr4X9+nY2hCmM3eo8gT79xishrRnNrLuRNioeQfU=;
        b=kPE/qelAh86UiXGCKKUrYK3kWgqx9a+rN+sUPIq56ckzkPvQWZxfN74WEXHqYnmz0z
         I56r30z7oaeaJ6TIoQBrUabMwT9h+F23MOZjDLn2uKPzCwr9U48ec64ujwEQsu4Evqxi
         nRPNwK8E6RyE/UbYkBDvZAPOXgFY2EAbrxImAtsEOMdcCdzfoekp6hcutd3x4aECVbKA
         RoRvOTOgtCIlszmmjKibDYXOZNRFzhoi3eYNg2uCC+Zfw+ZWIjz3DOeiqT3XpJD/ET+E
         SdbcJ4A6qIooE0we2MO6dcKo0BjNUUmAB6dErvUu6HE2X2UEBLeFSqge6RdifQoLVaIs
         34Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135234; x=1775740034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
        b=jK2CtnxNMdHKrRVXZ1fgAO/DJVRUzvhj0cKfZvI3/arfpgCrE2wJke5Tl8iYp3CjMC
         vE2nyabJCSxELb9qktOK2L5Ebve1EjS62LglY4dowRQucbpPTFM6EDVGkgtPxbQ0k36/
         knZ+Pe94k7954+mtqa6PMYfxa5Jnk16wkP+s84RAutQJOSl9KLSPqhJlUokzOimboBWl
         GbMNUMYIHIQS8oc3LHaitYjvbCxYPGh5TefIZTZh5WB7H+jrd91+AZQiaNKjsFReRq1G
         +bJR8JF7GodtkZpuPuHDap2D9vppE2rypHbvZqbtu0FSwIc0h7nvfI8AMPTsRN7/c84d
         pNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135234; x=1775740034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
        b=P8a5/2DUXLX23r7Vo0N3CzDpVdFsR06Igu0fS7FHVWjQgf8p7EnzPLKTP+YRkAv5VO
         rZabV40dMiGthYv19A5S1QGHzAs0agkWI6GgBke/v08UeSHskJT22bIImRChL7rBGA6j
         hD2RGthK9WtPNwFuBpy3Uev/Jh6fyMB8rSE408+mFnJGjx+GiXIMmUNLCAxz+09T60DS
         Cj8Ggdq5TLVkKFZ91h0Ova3cFu4BNMT2dgIqAblXv/EhibcQKT28gouheR3oTFP546Ew
         FwQ3q50yZpgjpTLGJInw8JtiW8CbG4ClpQe/vOhS4hw++Or5NwvcFSmPfYdSk0rQqfwp
         84pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQGU0vvsLREGq8gyBIb8GrAqpRefgwABCJxfBlbDPVHglV8EbClnthUt/bPng6MimmtlTP5E9Xl+IVJo7HgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8deke5ODxZA1AsmUi7e/euyRh6JLvv/H9D2I7cqAX2Rfq0NU
	A6oc+8SFGJtsWfVfawRqygcMu60/IydkwNCiWdOMEFEAHbgE0xk0nUSjKM2W4q4+L9FueYFE/U5
	cwn9uriY7r+kzSoAd6jER3OXXUY+ih1Q=
X-Gm-Gg: ATEYQzzX3joCtNLjynGPnoPs9/zIm266jS6hCeMGvLJ9CQCdtI6/M8Dmi8ndkXUEyFr
	73Yy5QkVwbI/u6QnINAjAVGd3KZtLeXvMlfqR6pgA+j+Jx3d6hL6o62+2bkeSbo3DTogCMde34k
	vL3qdqb+wlFu81lNlEa3RsuBfgoYuYKIx0ogj5BzNHBzT9W54s4tWHnLoCrmbE725YAaBAGz/x7
	W48SztYRu7012/9HSJISCUa6H6pL4tlnihTzF7LvhurSoNZ+Uedj2f3UfS9bUC2gjGlCqJOMem5
	i4A3QvQ=
X-Received: by 2002:a05:6808:1453:b0:467:2e8a:8c6f with SMTP id
 5614622812f47-46ae02246e6mr3682069b6e.54.1775135234354; Thu, 02 Apr 2026
 06:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com> <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
 <DH939HK0611M.22A8T9BJ3NG8@gmail.com> <DHHKCFIJUDDR.1DKCJEY9I81EL@nvidia.com>
In-Reply-To: <DHHKCFIJUDDR.1DKCJEY9I81EL@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 2 Apr 2026 13:07:03 +0000
X-Gm-Features: AQROBzCNDuLTNS5vepK0tiGK0rHJ2YWUZ-f9bPw71oBdVgewCSJNEGDn2F_SNZ8
Message-ID: <CA+tqQ4Ko2n0dnEx50LGbTBT9rQzXq1yToMw05xd+S324ZQBbiQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 5:19=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
[...]
> Thanks, I could rebase my nova-core branch on top of it successfully.

Thanks for confirming!

> Can you send a new version (maybe incorporating the `from` helper
> attribute I suggested) to the list for review, and hopefully merging for
> the next cycle?

I've been caught up with some personal commitments, so I can't guarantee,
but I'll take a look at your suggestion and try to send it within this week=
.

Best regards,
Jesung
