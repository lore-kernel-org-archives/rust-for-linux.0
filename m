Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D22421885
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819721; cv=pass; b=B9ImRxVV0wXoxgFUL3JOD2OTi3J/W/Sgyyr5NJUUN3hADEmRzi8wq8or/z6/cHYb4CD1J/hL1ZszjkhQEZAA6DnRETFCFxLhDYKfoAIMANHd29dSVNt7H8PgtTwdu5x4QlnG/4jaPdrcjF4q9uA2KeB9pTbmX43KGqLMbFrdJIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819721; c=relaxed/simple;
	bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qporlGSYJzSLteor+sYRYpO689miOV3ekCckOHHhOy5JSLlGJj0zkSQvBm+SavlGCtL6h2lpW/RqbXEGd0FwsJbbd5i987zn8d9rL0XWtsoEZrZEmboYqE8dRKQ3fKjopg41hMPIZrGyCJEWfS+7HZLtoVTo++n3IHPKzG+TyEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlXrT3lW; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlXrT3lW"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so937950eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 11:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779819719; cv=none;
        d=google.com; s=arc-20240605;
        b=DuySvHNrqlR3jw7mXe2aTICKs6s+4aHlr4lEdaMgFe61FX8HAjkI6FHyif+xblqmLz
         OjPWRjZ+R9mVm+5m/0+/V2+ESjHEPfDt7XxIf6FORAXAvVvZWUI9PnBaqX1TAkCAwy3y
         T0HMVTLnandk8bKSPrewp/EWPd3D54wAnYb60sJ4tFqp/USG+UzAN5qbApJ6jYnVySS/
         26aPrmzRIUMIOIGuW+xybZODIozLrt/zl7Koi3+1VdLV9NskCTNbU0hcQ82t7kRMnZpb
         zgi0MLo0MmPSUu25k2xg1EaVdNsnIf04DTw7pPQkt4fmAcktKX2eOvnLXdPlaUlquCbQ
         Vbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        fh=dNzSh3uNO4wz+qhdFCdZuiNR7KmZoCnUTtyhtJJy8+M=;
        b=iei13KV9Peo6aT/HCoNNgrh8RIDh0cR3yuIb0FwosY6IE9SfuS1KPaTFRzOcKcLu7J
         YqLoU9y0hQ2KY5VPkFr39ZUBDNGg7h4HibEDtENAU2ou9cJLMMbJcVe2KIMlhqGO93+B
         aZBCHTdyqw/LPz9EfALUMg521jqZ+eEMiX80VZqnjjXUw8tKGh1uPfOqUfu2PO9xn2UM
         DrJl5hpClQpl8bl06ZcqENZwqAbodFxmprL5DF708jfcciNuvMplxxzhFNGbNNT/F9Ck
         B4gmMlyvK3KVswuDyzOw2YfVN/woOgaO0+sg3NvkKUcR0wg8TH1UBdCfVBHffe+7RiMl
         64kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779819719; x=1780424519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        b=qlXrT3lWn7CREfHFK9zMeIZFg0kNvix1PpPz9wUMf+cvc2WDwVU0o4MscpxyJZhsGI
         CwXWZ/zyfXOhEd55gNKMGYb1D6RsPL5KQCZ8ZPTolJcNjHcvsCeR/O0ha9c4quLkTHBp
         9a1881kAzfVfGOoLWAv/H1W7QLffXVCpSuc+KeweCYGVMxhYtGMys6zfzis06qTG7lgh
         q7IJs5llE5+fvdiKNtaVooKmVgF2yaUjVRdYtljW1wmVs4FAjMBJed3TUB3bpB3Tpl+7
         J4O28IKYG47fna6IZj6UJ8i/pJH4mQHEAvWcbe6pTRn3yFCJi07wFqJsve15L+6ZnUv1
         9C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779819719; x=1780424519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        b=lTL52HKneZ3KvC3WKuszSv+p8BNfsXVnSjtUYuU6TCsVuKCbf6thAiJAJV5PLhu/e5
         GS+PxigXMsCDJrf5naFIyMNMFU6WxMnV/ghSEnEaJ1Ijuo7RmzurZnj0xkKkzd6Ue+lf
         L23dzpaqdP6JauFpuZX8mvv8Lpzk4p4uII9tJGkcVVR22UZRwu77cbdX7u05HOkXmWC6
         adyIEked4tO8OqfhS8el+Dp7V8IpvxN5SfnxEciDBH7JOk1ioTg0oDYEOczaBS4K5tdN
         cjTgTe0m2M8PP+FXpP2Lu94CfjmKAwEFz6pZsWDjdJg2uUOP8xWEhpmumI+TBSm4wQBh
         JiVg==
X-Forwarded-Encrypted: i=1; AFNElJ+v6vQaeKxk6KZVm2zHBWZ851uYuPgFlrbiaYo14B5r3k0c110VoAHDhGDxiNyGWobh/XuY4svaB6OKR9YOPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyP/udocQRTnHDGTIc9/2ZLymg4y1l3ymcnRu0yl3f/rAOrHE4
	8eIsolJYOcbFykzw974kECrsCfi+GO8DSz1GPJXpZKUDHotMt8ZSVZjG1qekCLx8G4VBZWFQs4D
	HvJyMqxdpIlfWDle3Uz0kTw9xVASY9RE=
X-Gm-Gg: Acq92OHJH4/fh7snrr3XvsEGuB9TtHMM7SWE7QMCh7i1uPB8Im6jr+sgrIJc9jtSKBA
	myAXCq4xtyRT4vInByMyhdUXk76OcdrYIP1oXpIN83BsJdZE10uQ70YDQp11FKtH8pJKNty4Do4
	zqymdak4keHw6WIoDJ0hpLY0kjjBdRdxniSQYKPVs1EbCMwuYugdjYFCbt4a75QnBuBiM4G2rHK
	ZoAbiR4LIOLhewSjYsoPZaVIBrH6YEATzL/F55JiLmW+rA6k2dxMtdmlg+PCquvAPG7Vl3tsuet
	lPownzqqbJdTmBQiCxk1WS+rl4X62HHy6doQL1GFYW+38/PLGcRPQKNECvNnsFUKV5dTw0mFVWF
	2cn1Mg1OJN+Kbn6eN5vXLntk=
X-Received: by 2002:a05:7301:2b06:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-3044921564fmr4123223eec.8.1779819719412; Tue, 26 May 2026
 11:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525202921.124698-1-dakr@kernel.org> <20260525202921.124698-3-dakr@kernel.org>
In-Reply-To: <20260525202921.124698-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 20:21:47 +0200
X-Gm-Features: AVHnY4LERaGUubmcoHWuZ6pDVh-Er4DRAsv1wa0D_Oc3ExDNDH2ULqOUOsIQmwA
Message-ID: <CANiq72mNqdOmQ3Va=EF-Fg+-BXW=O=px4z4+YQTS6wzL87=ZHQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/24] rust: alloc: remove `'static` bound on `ForeignOwnable`
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, viresh.kumar@linaro.org, m.wilczynski@samsung.com, 
	ukleinek@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	abdiel.janulgue@gmail.com, robin.murphy@arm.com, markus.probst@posteo.de, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:29=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> The `'static` bound is currently necessary because there's no
> restriction on the lifetime of the GAT. Add a `Self: 'a` bound to
> restrict possible lifetimes on `Borrowed` and `BorrowedMut`, and lift
> the `'static` requirement.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
