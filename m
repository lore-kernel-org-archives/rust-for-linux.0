Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739FF3CC327
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779840003; cv=pass; b=URNPYjXXy6YSszME+r8yt2sJ1QouT94FUBds4HrDx1n8YKl4S1oQ0UvovJ0JvroaLspMm9d3bKVs54DFDtF3/wWDV1zcsVihfR/DDO3OPIL8b426GvFC/jQ9GGig4zvsI2mhAwsfHJh33G+/cXdtoWATM9lBIckczplvaHCpIVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779840003; c=relaxed/simple;
	bh=IOnBLCPvO3NhNULOKmAsnK/+AVxD94h4t9BDNjzs42s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSsJGuQbXsP2L8NzzAKoEchZObRTcVdKvS30+1QgXSjoqwpSisvsMvbqDFZvtxNVLfAIRL6r106PITSHpRR21LoIvz4X+alKQY7EwARAKNfimPPSLIcg/tBfxytETzeLvFr6rYm1SmKMarB7WqEgrevzg1tI2O6wyXW/XsDQ3Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ThJ/ePrN; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ThJ/ePrN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so11a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 16:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779839979; cv=none;
        d=google.com; s=arc-20240605;
        b=H82DswWqw4TCUsl08Hk1f3Styyx5Sb/li/H6fiywVzHUhKoszgbUaxWEswGWquI39O
         ajl17ncDPhzvunwbQwvynN5NXBTuf68l2XZ6ZMja3QxuOiVzMazyIELPqTunCP1Wj2le
         avCmMYfajnzScFXHEYdgLsP+LPQ/Li7dFx9COG/9EHIdu0JExY/HhhlT2EyVyKThIukf
         lj5h6LPDpSVPXWJ+9WVMECE3td1+KScWVQdSndOZCUaRuH45ZW+sVYKwV8uI5AC9gpSu
         6NX3b5KqrlBlOdmjUzxoQfcKwOnpZbyiNC25mNwIKnVz2NQHG2gqaz7+ptMQJ0xh8/+7
         S9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ddLKUcZEKjh/VeC6wO7L8rHmcyDC7Ag+vZxzVVz7ubg=;
        fh=mKHqjGM5gnRf4MQXhw/izXzhGZaVzjeKzWyLqurTGzg=;
        b=H30kf+WXIX9aOq84plvPf+LThImqUmAQ320rLtA6DOLe8X+ohbGx8vQAPX2AXNmQVc
         Au071++9p+tIImZiw+owVOoZ5STfUZaJ5uGeKP6Z0CW0VOHp+at38h8QtivR3a04KEH8
         ao1/HypRTHuzLNPkrdpntBeyDB4iUwjDA9WlZMtFjfbDnB1ek46PeIqTGcRH+TcuPjMe
         3o2W8BjvnPWuYc8ErwDQQFnqIrQCXR81QaW5eeX5O2iWS9k+yFazpUo6SgxOJUWPLk2V
         ePkLhjdJcZUnf48+2ly+7UTgvx8oj76qI0aAyS9XSN+tvUv04wQ9qyDIAcgO/zDKM4Qr
         d2wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779839979; x=1780444779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddLKUcZEKjh/VeC6wO7L8rHmcyDC7Ag+vZxzVVz7ubg=;
        b=ThJ/ePrNrivOEc9b4c4be9NtiEIjAYTHeBsnK4L9Rb95dB1sZm9e/kUhDFRw4z42nU
         qnzDTrCVrIg9k+Gy4kyL6YGKkDLpQWlfblL26sH4Kulx7+hN0mEsrbvHTXBqNMYCUlXp
         P01kmewE5I0+KYcmjhe2PedaIs9PABWRQmp9LdeO2D4GWkj+0LjKKMVjPsOvgo80eOU0
         IJdnped7ODdrbhV0twjnJjJ0gubXJUD6AlRcV2I2x7rueemWGnafLvO3QdQXv899aV4E
         1/DOpYVywX9S1nPm6V/aYXGbDFuyyQIRzhlQCLbbPffKQFT+nfJhFdNRxfIB8hakqrVt
         T/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779839979; x=1780444779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ddLKUcZEKjh/VeC6wO7L8rHmcyDC7Ag+vZxzVVz7ubg=;
        b=ddlMdBH5st8vdW2Dz6bG9VFPS/ZRQtFMx4IcMa9stwow8sL0pM5YL3FbvqYr/+cDAB
         o8Ql+q1OOlRH5XaYO9N7VD1S82ifio49SSNz1sAdfC9fS+lZy5OCwhNqPAMj47pyv8mu
         H34y2YmzjTYDq9Ex0iitcBRqyi5GSw+ICRPCWNg9jvhktvfCtYwQzHwDG8xbBf60rp0L
         J9/yCcLBtcPrNx/yBQXcKTnRyKn/a7UOsaNq18zaCB4uEVFNYP/Rr+R0XneguZ97YmR3
         ElBDZO6+vv+nE7wfbJw60L40qlr9HxUWHsyo47Dhx7efasRkzNZLBPcb2Ah79VtjrR/F
         KR8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+B07piP1TeC8rvNsfzOeh+xKySTLIgniR5nyMS/SHyCYWktpCG3Xbks57RPJ4NfxoD1jfCj0LEhw/Jav3sAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCC7uknK4/FghE4Ewryay0Jn8dHq4UGvfHK+v3MyWWhF37p5fa
	Yy1udKAYtiCBBvh0B/NJYmhCG4W9YvrJvnUSB0UMuorg8Xc7ANGwZEHlGnXXPbUZ4ndm+RxDHVy
	scJewSIlFfxTxQOm77G3fdj7P8+ceIFEOurknYYMv
X-Gm-Gg: Acq92OFwO1QpwWPRRFbBOaervsQMO99W0WGz/+hIXeJjDcIrtb/GhrXSAar/cUXaebr
	J2rB4dMwUSQ5fWIan6KHKssaIU56jTzL51il01pmO9/5I0vwH/mK11fbV1ZlCgF+KRRUCs19TEJ
	1zEk599uno/ozFtkO3wsx1HylkVHfNadfrBqZPUQPVEYsEaCuy05qGEIhPH3Vq7TkxOkwN9s6OC
	ZNq+V+MB7pjwMSzUvnfmv1lE1XZyfqDWuUK3ad4y/W7Kra2Yn5F+uan6F8/joO9PlEu0y8GijiD
	Zq4+3Wzxxd+7Z+k=
X-Received: by 2002:aa7:c48b:0:b0:679:4b60:c7d2 with SMTP id
 4fb4d7f45d1cf-6890a047644mr138223a12.1.1779839978918; Tue, 26 May 2026
 16:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org>
 <177983883957.35274.15506019019254966722.b4-ty@google.com> <CANiq72nq45d+kvyR8jp-hdJhFHv-zw2i51mPCduBeUdgSwMKsA@mail.gmail.com>
In-Reply-To: <CANiq72nq45d+kvyR8jp-hdJhFHv-zw2i51mPCduBeUdgSwMKsA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 26 May 2026 16:59:02 -0700
X-Gm-Features: AVHnY4LR2XMEjvxMyvYWYkdUO4K5AC6_qj_1wz6o7NrReKgVUHEA9jcUWqjE_5I
Message-ID: <CABCJKuen4ZHaTzJccjjhhJ_ACKFMHCX6pT20O4V9xCyV=9eVOg@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: use `pr_warn_once!` for null pointer warning
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 4:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 27, 2026 at 1:40=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Applied to modules-next, thanks!
> >
> > [1/1] rust: module_param: use `pr_warn_once!` for null pointer warning
> >       commit: 8d2a562b7efe98fdea57d10caaced911fca46a3f
>
> Even if we pick this one, should we credit Adarsh Das?
>
>   https://lore.kernel.org/rust-for-linux/20260226120848.82891-3-adarshdas=
950@gmail.com/
>
> Or did Andreas send it earlier than that?

Ah, that series was never sent to linux-modules, so it wasn't on my
list. I agree that Adarsh seems to have sent the same patch first
though. Happy to credit him unless someone objects.

Sami
