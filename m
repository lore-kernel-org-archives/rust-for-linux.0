Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1189314A84
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770765130; cv=pass; b=ruYif4v/9BFvG5JJ9MLcfoCG6qLn1SmQWyk41jba/HfukA8KnNLOen/8bVVgBjwIOr7Cu9y51qFE1hz/pFLz28ITNe63yldqke/yR90mr5uz1USzsBi0eXTfGZCr6oAfkGAGanrNz9njmOIwQ51xknfLdRA82/sbhcsIF487VT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770765130; c=relaxed/simple;
	bh=zEkUNYLSV3eQDekkrIlBKznKqVRFszdbLHJB7j9HJuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsbmdVM5YDtemxLndBc0esn42SPmI+6cCUO7mqVHDH6CSS2k0Hc3yA7eRn+dNrW2J9aTuLwEU5CrYNOIEzfW4fYKbpZKYUAyLVCnYbhhgzVx96wz5hijIhHpBXhBAz1jD8k8w+Obf0MPhjDx8BS6BVC79eINB0IWW4XYaLDle7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EER0FabW; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EER0FabW"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b8095668ebso508880eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 15:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770765128; cv=none;
        d=google.com; s=arc-20240605;
        b=Ip0UZL4RU5bDIjhCGByNC/cUzwgbqrIskOCIfjUwb69K641Bb5LwgaV1SYJL6qPAAZ
         X99gi3s49HWvLF45U1iXwIFI1CI4qvR1sOrNZfhpaAN1o9C6lAt7Y93hpe7ptL0w47zO
         hXZ712oZ/oS/d3FgTKwk+EpRqQoRB8gvXY/nbiySgHiqwAIE/DGnniRqPzqlwWVbM0RT
         1Xorw/Ihv08412LsSSaNQ+KExGSHqiclRDobXoew2bfoNhs3RRRAd4332Ho7f2kcV3pS
         pMNsnhjhXeLHN/x/vGXvVaX29mbtVGvBKpzioAE4A64e1ntKpxCyUxSs0srx0LaYhcfs
         v8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zEkUNYLSV3eQDekkrIlBKznKqVRFszdbLHJB7j9HJuE=;
        fh=4O2lERqqbTtcj/nhS1587aBE++rp6QnYxGeLlsQ+LAE=;
        b=hChycy2Ixm3EfQ4q/hJ2CdxkrZxtkbM0gISCPiEn5AC1sBCf/1zb9LMD/IFUhGSf1G
         J9y4z1gz78T7pcJ8vwjgvXkbM7zKePluOzc+f7S9MfIfgCt4cwn+vQ40Qvdbc4nbAify
         s301RwuA9z2ueO5wmTibPFH0wai43TfxqPDHKiwXEzQLYCT5ruIU2+KbDsLP05/JQww8
         Th4na2RLCF92fuuWdjXfbNneNxMWIs8of6RkOQr5WNVv3QX7r20rWK6Vh42fwXQRCfu0
         ud5fM0gJBghWPW+nTJRVbeLGcxk0wCr6erHqIA/UU6s2h41j5aDagwbdBxCMT0ZYdWBh
         dMFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770765128; x=1771369928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEkUNYLSV3eQDekkrIlBKznKqVRFszdbLHJB7j9HJuE=;
        b=EER0FabWWuXw7NEzNzkDaLW03doH6guu/BEky8PznGxbQBO2l9AlH5nApYGJG25ka2
         CL3bc/BQ3DFZDXoN3j2ttzokIIVicM1Hwq5Y5gxO+O+ID/d3KI5MANqP3yVmrQT/rtx/
         HRo0U//+74S69WonBcfvkOfo399s9748Q+I7QRE+2MWcC0Q2HNU/IlyjcUhQ8U0Nkm3B
         ZFwlqxgCOHIXsODcsdTEBbsWevj7R65l3a4R7rbdmlbdhxvueHQpMp0DLR7OSKzc+QnX
         zGEpxexF8UeB5HtWB2N+LvJXjNStvquv+CDc1tndbj1uH+UxD56CabfuM8tzGNPqxLDx
         ykYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770765128; x=1771369928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zEkUNYLSV3eQDekkrIlBKznKqVRFszdbLHJB7j9HJuE=;
        b=oM6K98cVkgelStw44tQRx6/hnHV5tqw7C+e8hW58Bj8O1/sXZKFg4pYNWRnB8Wmk+S
         2Fnin496FLrbeAURUNoWG8hG9xZDocKOEwJtEQgSUJNgEP+Lj26JStQSOhnjn3h0I1QZ
         AgIJaGfDGtswjV59Zk+0ENUXeg2rOQFZBM+fak9dtiAvDBnxWk97GiKrbVcSJa/Dkhic
         ZV4OCKBdeJ2EWpb3e+WFaUBh3QJVBY8vDHr37Rp6Sk1CnPJMctS2KfSNpFaHuZvko16P
         uXt0jaOc77Ytxn9YvWf2lJupJqrRgQTMo9fMc5Cm5DFYFDQiDEopNIR+iwe7/IsMAyen
         yaIA==
X-Forwarded-Encrypted: i=1; AJvYcCU54sWXqd5JZxcUHXEmiFGUF4sXDTA10L5+yBqth0qhYAsBatCTBy2ajeVSvgzOC7nV7xyAmM62zWZ7S5JkWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHnYe4Ps9aoiYT9JVxbHn6nyDf+gJTV8OBw/Ji3Oa3SuxCHQL
	xOb7qHp9tJ0LIpmEO5kPgfjS6v8FQ3/fFQkS1pILsxmxKfBx8Uhq2oXDb9twgaJEFCNqSYlo8KG
	j8S2RAXNaOtFmEUBPXQjEW0HYudY3cj8=
X-Gm-Gg: AZuq6aLY3ys6ln4QIjTI5bzTTRjGDjaIwUVwxIiTfm30qM2BtK4DVt6bCpSwezxn82l
	7KORitH9/Ya7MvNpYs6Tx5Waaf0fx/6tAeIr0Zaq9VINo+BsK2FdYCWR7sifH/ESgEbqLo3iUW0
	0Bmtfz/CfG9FQ7odlA4KrZHxFTibqFR9jAP/WmFt9ftZ5kF/3W7K/EA58jyarQLMS9XeHNwwNnZ
	2GnUPkf7yPR1evk2jj04gRaij7/zKq+pRU9pbvs8Cas+3yAspKsnTdYdrZkrXpEha4dHG15/nr7
	oVpW6KgkOtXpmNdRiiOfarM//ltRqixM+RVdmtJEkCvA5L+kdpYF2e9ALpZB1X0Kc8WaPYkR6Kh
	BZ4CjmjB5JdBmiwHekQwWL7fsyTeLycVH2KI=
X-Received: by 2002:a05:7301:3f16:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2ba8cdc79d2mr658473eec.6.1770765127966; Tue, 10 Feb 2026
 15:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-9-51da5f454a67@google.com>
 <CANiq72=-Xh3wVA=nu7eYOEqR9V8jpLziaVHTFXh2n3jYAsrzvA@mail.gmail.com> <20260210202630.GR2995752@noisy.programming.kicks-ass.net>
In-Reply-To: <20260210202630.GR2995752@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 00:11:55 +0100
X-Gm-Features: AZwV_QicflOYML9pDdmNy_sEzwJ3QMmvG_iXXhzu6NRqVnT2xlc6o4VOCyA72jk
Message-ID: <CANiq72nOWV21W14Jb3rW65Lbex8njTwqitAUK9D1wH_AAM+fwA@mail.gmail.com>
Subject: Re: [PATCH v2 09/27] rust: jump_label: add __rust_helper to helpers
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 11:52=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> Sure
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>
> I think Alison poked me on this, but cracks and all :/ Feel free to take
> through rust tree.

Thanks, will do!

Cheers,
Miguel
