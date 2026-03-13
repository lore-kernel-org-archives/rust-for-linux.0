Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F0C3DA7E4
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428258; cv=none; b=nu6qFdeQQuiCyjSOvJFxwXJ7skyOJyH7ELRjQeama9bGCqnwSI8G+ap0+W2Kq5c7jrSQmgU8bajgJe9OvkF9cJI6A5CMqSPV+H2A4KS+rdJh7RO1x0ACGkg0NJE/3caNaQ1C+hN1tKX51PuLkwCJMG3hHehBqL5VntCcCb4eDDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428258; c=relaxed/simple;
	bh=34m2T8zjB+u4MLGHeKznxeFD6ttVQwhK+4XwYx0EGyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJDQ2DjZ3gGvWnHKcus9FXJ8eKykEphUYMa2k7NtdDe6WOG0JdqqQwhFOUR0BabDgR0V2V2iJeb4O9veenCpRS+Vq9P7r82m9POaJCsUy1VywjDbZ4drJHub6eZ1L8Br5SQZdotuh/N15n3UTbvjOGlLkPwq2p3BWzjxegVa5LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rN9GwUbY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rN9GwUbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C380C19421
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773428258;
	bh=34m2T8zjB+u4MLGHeKznxeFD6ttVQwhK+4XwYx0EGyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rN9GwUbYc0LU//yQ7aS5ISpKN7mJwws6vgq4FtnDBrD0ZfmAGZkWuBdrmK88j9RVJ
	 L4PA6Xz/VqnnAgsKs0d4ptSSCWYKdgpyNsYRiZu59dLGZ8GJF71YdkYdnBZlGNgy2t
	 g8mX1QE5P5BjiJ6MMMaky/6/DtTXfC5E9lxRBWsrdyOtymwRis3/5dUCUOcj1xSUBt
	 4UxZY/7KzsPiF0lTE/v9jVrg8fKhRqEp5TgjI87w/xWFaqFZQrv6oggKNidnLbib8T
	 jO8XoFUDfttizxkmPNE+qajMbg3lOIxt/+PHWWVpxD8+7Sk9eBAL28YcOOufezRE0w
	 Um1G5kRYVq14Q==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-67bb0267a2bso989780eaf.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 11:57:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeNjOu+hgfmm+IfLV+cYBcNZfaA698gf5nsWvGZ5s4Ntw9xOwsd9ah8nbxqs926+N3U8/NmHKAIvZw0ug45Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJuFF8aWLD3D3GiBrkvMiAx4mLsYHiJ6Yu1SuqfCWB9NGkyFCn
	owJopdu57cDX5WAYhmxX7mLjhALWRMAcjLllK07KQFmrNYDWb6opb9o8VvHocXGff7aKBCUnhRM
	H9eQOK32FO3znC42i5E2Bd9AHMSx+hvc=
X-Received: by 2002:a05:6820:c93:b0:67b:bf52:9987 with SMTP id
 006d021491bc7-67bdaa63959mr2561459eaf.60.1773428257476; Fri, 13 Mar 2026
 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-synology_microp_initial-v3-0-16941debd8a0@posteo.de> <20260313-synology_microp_initial-v3-3-16941debd8a0@posteo.de>
In-Reply-To: <20260313-synology_microp_initial-v3-3-16941debd8a0@posteo.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 13 Mar 2026 19:57:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hYcSDKid4cbz8ZVZG+vLSHvzPB2UryevEpE15W1w7G3g@mail.gmail.com>
X-Gm-Features: AaiRm52wIYLXzpbrcPk1yGnN18zABaxFLxVozfWcNMKe7mZAiwm1YS4O-8Hh8h0
Message-ID: <CAJZ5v0hYcSDKid4cbz8ZVZG+vLSHvzPB2UryevEpE15W1w7G3g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] acpi: add acpi_of_match_device_ids
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 7:48=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Add a function to match acpi devices against of_device_ids. This will be
> used in the following commit ("mfd: match acpi devices against PRP0001")
> to match mfd sub-devices against a of compatible string.

Not until I can see how this is going to be used.

Maybe never.

> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/acpi/bus.c      | 7 +++++++
>  include/acpi/acpi_bus.h | 2 ++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index f6707325f582..5ddcc56edc87 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1044,6 +1044,13 @@ int acpi_match_device_ids(struct acpi_device *devi=
ce,
>  }
>  EXPORT_SYMBOL(acpi_match_device_ids);
>
> +int acpi_of_match_device_ids(struct acpi_device *device,
> +                         const struct of_device_id *ids)
> +{
> +       return __acpi_match_device(device, NULL, ids, NULL, NULL) ? 0 : -=
ENOENT;
> +}
> +EXPORT_SYMBOL(acpi_of_match_device_ids);
> +
>  bool acpi_driver_match_device(struct device *dev,
>                               const struct device_driver *drv)
>  {
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index aad1a95e6863..0081b9e4aaee 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -677,6 +677,8 @@ void acpi_bus_trim(struct acpi_device *start);
>  acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
>  int acpi_match_device_ids(struct acpi_device *device,
>                           const struct acpi_device_id *ids);
> +int acpi_of_match_device_ids(struct acpi_device *device,
> +                         const struct of_device_id *ids);
>  void acpi_set_modalias(struct acpi_device *adev, const char *default_id,
>                        char *modalias, size_t len);
>
>
> --
> 2.52.0
>
>
