Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795480196;
	b=4VIupkNMCf+zsZpQl4ZAuj5xPVFQhr337f4ri2PQ8+Tqt6cfNsEu9e5XFzzKCSIw8JQ3
	 mhTteEoC93GIkoLm11HeSauuNUnHhNjWgyhQxtfEZ3qq22mp8uLYFJjNjBc5CRXVMelPY
	 psMDeFHcB5RmL4q9AT9x7bT0J5fNpavHHyRdR4uHR/gU78yBM35mXG6f0fbzACnJVtZgK
	 v3y+oOCpPWD6dfbWaoy+w2ArsXnXOeELtaxJmbvVZCCYrPUeO35u6QwnY/tr+q7whCGTy
	 /wrTWd+vzOO1/gZ9dKrkHHpfm1Am5isWso1lGdoaFoiTyQH+qho8O8AsLJdeSEq3gog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4ZrdQebku2tJcTby3jvvrDkcxbQNvtQ6fURfLQusScE=;
	b=RqK0d3sIyzWjV0Tt8V2kC2vADBXlFHo/pBsK99ZtleXcpEmbudJhcaatxAx81hTpWXxv
	 S4OaWVgrWTL7EdunHn6lQ6WPY7gjSGTWIevHyYTjx24RctTqCROwyIwkscEBwinXxeWIX
	 jc33S3o6niqs0J6uNTZTF1gSzMsEhk2dBum+h6ByOznldM9K57FzSRvuNX8JfxkGs++bS
	 VdpkU/g0TNFmO0fnuREQvHPPAEiTKTlsE5pucV7NyGYrb2Hq4FUC+5tSBnZey+wP9vRqL
	 Htigy/F7lVDL1/Mei14IC3PFNUMuOC4u90R0KvV9KmleZjwjW4jEkdFGIcMUgjQG2qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvOZSlDR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82987606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 00:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82987606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvOZSlDR
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so292474e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 16:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795480195; cv=none;
        d=google.com; s=arc-20260327;
        b=gj0XGCFbgKRIcLNijxVkU4iznpNDCj1IjLy048BxjsG/f1C8y9x752drYUmo1TaqXt
         2OlwqHdjUB36fiLL6xt3Zj0/WgcCZJXx9xYPUDt0aeXdC5hr4Z5/XMp/mL6dmrbhRdXt
         OyRlmMXifzeyjAxW9t845Gtzu7PIOzJfi9fmaKc+LMVntxS4mfru3y01LAF1sLpYNtoP
         iwl7Co9RoEafa9dH0KfMiTkW7CoMD6UvLiVykl1KEIBbFDpbraXWzvEH5cMVI1AM2TwT
         MTjF9Y7PqEpIt4ouLrMKYPSwqoo5OX+FGToQZeJo1ve53nSAjIwfpVcn1C16ILurLoWJ
         XqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZrdQebku2tJcTby3jvvrDkcxbQNvtQ6fURfLQusScE=;
        fh=i7RgLzh5S1QvzWB7vBTnFLBLSm04ETlJE/ZmqmoLme4=;
        b=BC3abDiUPnk0RYBIPymdrUegF3saz6hs/zdbuiwpnGIc1weeh1ObjJQPJGWQ4Apovo
         r62Wf+jpm7X8sw9zEPmzrPqt4D54jxyeShxJ3uI5oG0k8C579Hgc2kx8T9O3iDjE+cWJ
         nuDED718c+lFmvZYqHDkTgaKePc6TdIZYzdNOBb+F901iFvQgbi/zghOtl1cxOWNYbgL
         CfhsWsYRiS6XGM1MyshhRl/L225lESbjKRpBBpzE7dhfA5WOoo6I1QVvPV8Xju+GhZXd
         xqEGoizJYWeZa9/7M+QKzSeyPVzUE8xP3Q4wqOCG5VdcqUp3kaZaIMEJuScTN6wIPZfU
         llLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480195; x=1796084995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZrdQebku2tJcTby3jvvrDkcxbQNvtQ6fURfLQusScE=;
        b=fvOZSlDRqC0Au5T+STnehDN+oQ7p8L72VQhOW+kud083LexrZlU908qfE5AsVFFgsg
         qUgPOb2JinZWb24NWGnnhfnqQiuOs41E9amaGlcXrTjNBPRKxGvX+hLOIa+FT4ieEwNc
         ObPKQb+/JCIvTLmgh0zHKutusV4Lp01aNKE2146sOeuhelp7FTbCcqY92aUJwoGKjlXi
         gzBRyw2Pq6ztya0LLLfsYjuHvku1vsJpTZf35pQmFWh8lWUu3nJ2HW2Bc7CWEtOOvmrC
         apjiGdx3unSFdwdhj2muN++yRdylq+N+9jL7idGCxDngZQB2Sopolxb/zzbLXTPxaWeT
         wygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480195; x=1796084995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZrdQebku2tJcTby3jvvrDkcxbQNvtQ6fURfLQusScE=;
        b=nlPDWz7xeWxzkfrv/+9DOE9ZLnXfu4sb3T7kpl0CLxsvoMTiowmqtQtsb6egs/UVgf
         BJOXV97tnI0KCdAdzaScJ+DW8VY8zOI9XlAjoAGuN88rDnyKae1MLUyysTRJGkoDMXIs
         7vXZFEIYe89QvuByA5Y+B4e+kpwjHMlhLixlZNRF6R0FuhNmh8ss58J0gLHL/GzpW6fo
         uWn+xmlvke3dgIGbFX4lM1YKeSgy7SXJIHsVEeKVg/DJbUzq74OEne12YRhtD2I66ZnY
         biqC3gnQrTvMZ8jPLaBEz5EQhLc2jrzc5Xw8WW+e7t/kKumqxzBe9LvG4gjg8SkgEZ1U
         3qjw==
X-Forwarded-Encrypted: i=1; AL+hErFeN9+PKiiB91B6qqrpSazj8B2Xm955KF1tJaY/l3eej0IXQYEUYwRajbR+2D7HeoVygp1hdeOkFTzY49aP6A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VkgRolGO1z3jrDGEfT5r8RlSV25NDWN8bNqAtm/DbBsTxALp/
	/vCOOVJzizs7G/wKMw6ihhDDzEVamWFOPZzvCNMNrUkyDxSMYjmKPw/Sc6cjRzXj3kUoPcQ0+WG
	R2xq2YCy8loIOZiaZy8UFWD4MQUl59gk=
X-Gm-Gg: AZFdTZeXd2/B/ZngYbvEkprupHpHxBGrKYk08J8lIk3Zcrs7C0AE7RQz7yxe+t0S5Vv
	WoZpizAeua27jdYDF5TVTXe4HBo/1yxR48kgrnnOI+f42eZiIsTbPVuNFbQEVyaLmyg6t5Ms0xt
	HNYOxAhcV7kBL3/uVa3eowZyg8Uhf29ae2OBo8jOdOlbo08y4CUebKMlO5ZaOwSpdD+a64A+VNr
	0IjrfAW/K21IhpA38GQOCBiLZXs6vv3meZJYH5b+vTUOyavL1d7oenfJlrFZMdRW4GUACZz14wy
	p6iXtAMC7B7JrUIgAWP8wJg4YnVKnBHuabmcpEdEHnXffS83aW63HEbLnJVwt7mwsnUvWWy/+DD
	U8D+lLQjD7NpWxmsNv2BQFVrRf+7nFxfRE+HY2OugMvI+dxv5pk4NW7EoKIOAtpTkDThQ+DTJ9o
	ENByyqHI/se/D9D81cpl39kRqgXpPPMPK4YSfqeg0avBhsF3WQEoEN8WizJUCzciima3HLlORt0
	M9+QgbIa8BFGvMuPFfUqhRJe9vL/TqCFIMWhNDQDj+JspANsKZcWubiZF9zQ8tj1+zBgRUJ0pY=
X-Received: by 2002:a05:6512:6718:b0:5c1:57b6:c731 with SMTP id
 2adb3069b0e04-5c1bc55528amr3266211e87.0.1795480194325; Mon, 23 Nov 2026
 16:29:54 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-rust-workqueue-safety-comment-v1-1-48e4f9b35c30@gmail.com>
In-Reply-To: <20261123-rust-workqueue-safety-comment-v1-1-48e4f9b35c30@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Nov 2026 01:29:42 +0100
X-Gm-Features: Aa3M54rrE_u_rDGv83caAti5z15PNAm8EH0SoQmRRpBUypQfK6kld0aTX-KOfZc
Message-ID: <CANiq72mZhkbe4J9r3-t9akSLpLY5HBwxGW4c1RqCWghobbpsxA@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: fix SAFETY comments in Pin<KBox<T>> run()
To: Andrea Tontini <andreatontinidev@gmail.com>, Sagar Taunk <sagartaunk@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Tejun Heo <tj@kernel.org>, 
	"Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:27=E2=80=AFPM Andrea Tontini
<andreatontinidev@gmail.com> wrote:
>
> This patch was prepared with the help of an AI coding assistant (Claude
> Code), which found the mismatch and wrote the change; it was reviewed
> and build-tested with CLIPPY=3D1 by the submitter.

Thanks for the patch! This would normally go below the `---` line
(sometimes we do mention testing if there is something in particular
important to say, but build-testing and `CLIPPY=3D1`  are always
expected, so there is no need to mention it, especially in the commit
message).

Also, please see this patch as well:

  https://lore.kernel.org/rust-for-linux/20261025114304.16730-1-sagartaunk@=
proton.me/

Cc'ing Sagar.

Thanks!

Cheers,
Miguel
