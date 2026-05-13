Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAE93EDE51
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671230; cv=pass; b=O58C+KiptEWUCU/1qaCO41S5sFCCokt9JE4yFlRx+LYVbGwy9Y5VmJVwlpdpkx271v9NvE9NDHgH+Pq98rcqVrJEEeox+BfyosAuWaYE5gWYo6UB8jG8yAmBdvihUYEbG25W2om7X7PaOxXRTcc3eKeZJdcTe+4oL6xtBbcLNcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671230; c=relaxed/simple;
	bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtMeW4fDBQK151sZoEhNg+A5EQbuXK471MOQ2kDS4CO1eQHOworwQRePOETZnuo/W8rNsKSw+tA1CqIqZTdKytuufM8hiEAjNwxH15QjF7BiRCglKrbqJiG7yfYaHF6WVOvmHL8fnap+nYTAt9AwN5A71EMsjY6ku6LS0gYHX/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0KAXk8v; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0KAXk8v"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f114d129c0so440225eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 04:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778671228; cv=none;
        d=google.com; s=arc-20240605;
        b=NzSkSToJ9A1eBfJ3URZ6MwqYSeP58tFZJkn9N/5VBnYR1meXCKKNkQJzx/78fd0dMN
         aFFBr6sPyIlqiQCjDToISt2cUe6KjOJVoFVB8jmR/hZ55bjLEj7MRt+OLN7tfivRiMKt
         /UHzocF7TuOGcWTNWvJEKU3ot5j8SzgGGqEyHGYRVJ7nHKrWOWk1MeMLvJaLriP6nvzP
         629bjhSsO94DcraCgz19XtVYP+a7OkSEcgNwbIh+QIo2wYFb0TYWQCvqNUbaTpJC4dQb
         /XtOYB38nz6Gl5YZEaZzKcRdRUnqxzo0hgVRLa8FGe8KUI3VW4wwcT+7c7qmE6jHOZLC
         zDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
        fh=EPqXv4iM4g6OVrx6bHwRc82JHeDg+SRvcoJGMBLoAL8=;
        b=bn6Dnm4QdfYKYpF+vbJFwrvNL8IXUY3YM6txs1JpfS4yyR/vgj+STd198/B15aGX8c
         lgm32uDf1/0q3KymiEJelZyf02+PJe6MLEJzFbA0JYJkBH1hl4yIa3U41EasVQeP4Ppj
         eDDZPrjY3IDMLsztWj+BQW0y33YzTRyE3DPbUzIUR4qysy+VOlWeA6mGgkQs/JzJjEh8
         fU2lToNW8H8q9TLHyfruBvzh95lEL7UZge3INRzGL8Gx3SQ7y/dXIGFM+S0KO+BmWhhl
         XDpgmuGbMV9srBdjP9RpcSAwEyMjKrolsxNPsuWpy39SatwUqU8KacWrryZ1ZlXw4HDN
         e6aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778671228; x=1779276028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
        b=V0KAXk8vt5St07kIkKlGLuZQvNc3cF608jr7GUutGB4OjDHDDddl17R156PJbZamkG
         6rXrQYyMoO6eBc8F6zvGBjIcXkNNkz4xQZLbOz0RR37U0YyHq8+TfBWL235M8FXgPj4i
         VSKbH4X5reETdfXaYrhoHkL1yrQXGlF3kS+QswAGdWtjC5uLBf+oKsNGf99CLWOJW0Ny
         6OaYwZuBkHCaBs5dAc1iLdWLvqY77mq9buDEP6wTEcYLD/9WoLhqNO4XJOEqb66st/wQ
         eoPrCO8QDMWvk4iXtrN+rbtoFB3id+ne2sjK7sohlbVpesO203QxB3/FS1ypeLZE0n7n
         11hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778671228; x=1779276028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iuo9YKVaBydc0nlM1kPuqsWlse8oIaDRa7dh5NmGq+A=;
        b=UOivfOAD1zYi3qEyk11vjpm95zBvy0GhUh649kou+GjYGaFTtvYzCeapa5fYQannr4
         VAPdGJwOWRb8htFU3MVk7cr++T4OAwAeb1smC/7Kd7jFjRQeOwPGnqCzXV2rUetJZjw3
         Eho/BrdWx1vOZibZJTV3YT6xU7gnPmfB4LUOQ6dQX+2YfQoDz4TbCwnLh1YgOb3qxJIL
         SZ9c67SLHfH0UTHKR0Y+WYleTk9bneI7ELDoJMXV3yK7gvwPXheTCcT8iP/dg7T0Iaa4
         n788xj3HeqmGsOE1nvU49T9zvZsGLci/bwx6euJYu/ozgOrVRQUAtbarGMHLQjTTZsHx
         Hmtg==
X-Forwarded-Encrypted: i=1; AFNElJ+2YzHNB3czpLIp7zghSstCB0yHRyD5X2IZyUC/qZwmq3VQmoHiVpWMjpjAXXLBgbX2FDMNKlYI+Qp6bZ8Vcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlLNGDV2eU29n3ieiBGxL12m2VDPEUz78kGl7bdtVpDTyaFJf
	Dl9nuzGeqjE7TB3q2XVaAPtWAUqI7yTQhcHRebwAx1uWUyGMI8Ofh84x8CyYkJSU86d1qtEhLy3
	2+fNwy8b/R7KQYsszKQO8eLI5jMJPNNM=
X-Gm-Gg: Acq92OHa2L/yHtOqiAMVCPpaC/b7LFEqPMyKj4d9sVKWhCQLPAbZvyUe3gHQ//qNg+l
	r5gffFW4Hd/QceVFq5O+kXpg5JbleROdYk8wLLTE8zRhN3qqud1YdweLh4ByTNhqpJGINyiyS8f
	VeuCgPADjfCIGO1upP85WGwuzp2mlFeByQoh81VwNLcw8fojGfi+STAPvdrjy5xNPB45LUjAEoe
	PJHJPVac0WTtmvw8tTwnJastsVVgGJbA7que9NxSfttf6/3xoKAuruep1uIm9AFcasG++6slu6n
	kp1JBeiuYVhcNN1g6c1KlSsbYn1WjTVRSrDmq9RzEdGovxnd/GtTkRhw/U/Z5jlPx36AjAL03vh
	3Wo9ipv4xTGXD4fzXBZ5zq1Q=
X-Received: by 2002:a05:7300:c86:b0:2dd:5641:ef0 with SMTP id
 5a478bee46e88-30119a73848mr943073eec.6.1778671227908; Wed, 13 May 2026
 04:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513092017.265269-1-work@onurozkan.dev> <DIHHZLJR583G.2PP9PSQG3HTSR@garyguo.net>
In-Reply-To: <DIHHZLJR583G.2PP9PSQG3HTSR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 13:20:14 +0200
X-Gm-Features: AVHnY4ITSI9NBcJjvw7hQkE_KivgW37VLCDitganNRd16rOTlXJVouIiC6TuvDM
Message-ID: <CANiq72m27gP3z0t80bSUds=2tDcnt9JU5X-=4nW9XwpZsiLuAA@mail.gmail.com>
Subject: Re: [PATCH] docs: update rust-analyzer command
To: Gary Guo <gary@garyguo.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, alexs@kernel.org, si.yanteng@linux.dev, 
	dzm91@hust.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 1:04=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This should be fixed by marking `prepare` as a dependency of `rust-analyz=
er`
> instead.

Onur suggested that in Zulip, but it is not a real dependency (in the
sense of generating the file) nor a hard one (in the sense that
rust-analyzer works to some degree without a build).

I am not opposed to it to make the target about "setup rust-analyzer"
rather than "just generate the file", since I think that is what most
people want, but I wonder if someone out there may be already relying
on generating the file without building.

Another alternative is an informational message about it as a middle
ground between "just in the docs" and "not being possible to avoid
part of the build" (and without introducing yet one more target, which
is another option too).

Cheers,
Miguel
