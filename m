Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837F282F0E
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010263; cv=pass; b=ZU9VzvIne9VRuGZJI2JzXaiYUFL3afHT46/0eFmGkkYOnGISmmqa5uustMYmfn/F1K/2eaJGETfUnqc4R03fC3sIGa7vw/C/zQfu6NiNwUW9w0YhNfjhw+Pp3NCU46D3xOuiH+WtAoHhFwefwxg1RPnA55BGYj166SOnra8k1ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010263; c=relaxed/simple;
	bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nyspe+C51fPZwXvFhGiPp5H6tt+uaZ87CBX82JqDlqLmrAKXdagZEzNZNfHWgEWChjaM/XpIwgnBs7txkx0nDaqZTjWXR2Jni0dFTJVjR5tXzFLdLGTeFwyox/Q6SWcNpSDcNzKIKqeyCU4+7mUPhSAat3asMOsIFlJtn3HDnXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCtUKLnb; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCtUKLnb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f13ae64db1so41663eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 02:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779010261; cv=none;
        d=google.com; s=arc-20240605;
        b=Fs0eNPg/gF9sUhC8SFF7mibGlQnL7LRvnW6gHu7MtSwys82wWHLpGhulR2o39ktgxh
         baNHrU9BlWuBJVFbwfEwdEVhQ1UcMpG6OIu0GTKTgV230SsvnReqHhHlzDq9JDyOdZFA
         fkbJP+Mw12/fb1GD2M7Md2EFxMqGloGoj22W3o8UGfCx6YNYzPTnpee2gwZZuIyd20ul
         0qfeJEdoyoyR5DBQQD5Sm3SlXWHcgx45vgqs7w6mvwmxwuYFTg+FA87Tyy82jQVMQNIz
         c7faLo6+NmqhPUfKx4hRnUN897Xg/orNUAh31PQun3otJrqlbFpVRFpgS3Mit9daFLUr
         qE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        fh=ikKps6FOfOZfNfrwEpmQPCKhyCHBWLE+TuXBH0f6eDU=;
        b=QTDY6F4hChq35D1F5xoX1/dkTLoJEFqXmM4YUVwgX9oed3VSl5NuhDoVRDB77qpxvw
         Xya72+qr5dbhMq9Op1Ova1+Ck/pPwJ839cC7WBkUZe7S11kzjhBlKVjBzN/oiiIxD6j1
         GjZkdrH1tHhgsqILeUivgAoF/ZsnmPz1FNp7VEtx3Wb+T0rd7TBU9eYTFXlWap4OwGiZ
         gK5tYGC6XenCR/VZ8Eyg/sRLBU3p90Hrjpmp6VbxBINlIEUW8ig8u3IVJChlrHpKwO9N
         ROw/5z2uznxc3zIDftWcN0eJyC7FRp38JG9Jnh+N/8KJnmCig36cOlUu3wW6afmvwdm0
         F2yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779010261; x=1779615061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        b=cCtUKLnbQwjHOBQmbvQgYF1WfDMRn9Y/5xHPQqn24MmyIJd593XJyCFQENtQL1IXbQ
         92xmA/PBzRKbaMzncdonmYc2jfJfAifZVN5jqMQcQsdIJNIHnqoo9fYmDPRWOB+5G8TF
         v+VSiuhW/mOXn5lXdKTWRThQt7T7tfKXQQgQcuqFbh3kdSJjCL6hw5N0mDdB98sheB/r
         yLhkUypmLWotpUn+Y/AlLUNP6/p/7s6oNj9L6zgWcREVrbhTV1nFpnvg+W4FkY0FpzbD
         mxiAUtIDqh71jm7I96kAbpSi8e9Msx6h2RaRyirRWOuR54PEXYWAVPl0UEx+7J2YLvgJ
         d2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779010261; x=1779615061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tj8PMwAalAJ+NmdWjfw4/5fdDmXngxe4fWcsgfJA14M=;
        b=Rv+P+cGgCaskcQFOLUU58YMfb58Ef8En97pXWwc3ITZ0sdGKvuwART7Bw0WVsd0S2t
         aLi7J2frYKaUawQ5ZRQAYh4jXNG4DP55eg80qa2Dd9wg2AVMMCrXKOhJ+VvZWA4IF4KU
         OtnLl9PxacJUH2eshZrDaUc7tD83U/iZxQfmwvGwM7Pq9Vwcb1UuFRRuEIKXFKdu2Fby
         pZ+t53Sqon5YgjTqNEBfLp/bCFgDTcNUAbN/lhqeVx62ZPticStEHzvhRaAjQKycEeMC
         ISrwW769vWumsYHY2DkPH13tuCdTn90Jza0iYUc1oWCrDuTPKCbNCWeMYr+4jVNPRdcx
         b3aA==
X-Forwarded-Encrypted: i=1; AFNElJ+U7PP3honufFDKRUTop9w0OGkB1er85FrD40Zz90Fz0jrjINs18BU/q/hQ0UFcfYMleuHIUKXF0Oqr0FBXaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPVjjyHbhjCnCQ0n+4LWc1O7pG4RMEd/XqWnhkz4utwDTd6IG
	xhskUZ/vW2nED/80cgj6qmt8epN6C9kVpMXjz17eP2RckN7MLVvSAiOoMM7FFlBlqNQKnw8Q+sY
	OTVqylI47afhNFXinGnd/ogfqfI9jKqY=
X-Gm-Gg: Acq92OE7N4IPK7RHe7h0Qj094S0h+woLyUQZHlkaPPa7Xlfn0EC0YLWUh3TP6FBQl24
	cgBzPrEJpuEqcWfzArJHu2okgqXNrsVjbNKCE8ZDAvDqS7yWncwnLqD/ei7IBbn+UDENzBgmcD+
	NekIa1+BP3Zaqr2rzi2C8m6e9OGQ63IjB22CNhoNGc3gzckV8tSkI56UFaS8n4Rf8vXCZ2C8xlP
	l3hOyWB98C8LDylyymYwd4Yz5Ad2Sdr4AlcAFgnRVDXQJjgK+Lj033u3gOJRCX8PIsLFdjxbsgK
	GwbO4p42VOGp2X7c+kqiP9lATrY1CfG62mF1wObVU5EXXVGLgX7MVCb5HroCBakY/x//HLFyHL4
	s9j9H4Kv9eK7vGZQPg5VDGCXcbi8cyC/yXA==
X-Received: by 2002:a05:7300:c89:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-303984e931cmr2228415eec.1.1779010261233; Sun, 17 May 2026
 02:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
 <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com>
In-Reply-To: <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:30:48 +0200
X-Gm-Features: AVHnY4LeUOW2UmbbdfLrnREDBNSldtrnck-nHpAbjlAYEl4rANYC3G7F97ZBSWA
Message-ID: <CANiq72=9nxRgfFf1WzWgp=TP9or=Mi=wLyME9-f2M4hti+ZNcg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 9:32=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> Using a ton of vendored dependencies would make for unreviewable
> patches.

I am referring to `cargo vendor` here, not to copying in-tree -- we
already discussed that in previous versions.

Please note that I was arguing for avoiding actual vendoring in
previous versions...

> I'm the one who suggested using FFI here and for command-line parsing.
> The command-line interface would also work.

Yes, I suggested the CLI in v1, and then you mentioned the library in v2.

Cheers,
Miguel
